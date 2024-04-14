import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logitech/services/rating.dart';
import 'package:logitech/theme/theme.dart';

class RatingScreen extends ConsumerStatefulWidget {
  const RatingScreen({super.key});

  @override
  ConsumerState<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends ConsumerState<RatingScreen> {
  double rating = 4.0;
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  Future<void> onFormSubmit() async {
    try {
      await RatingService.createRating(
        name: nameController.text,
        comment: commentController.text,
        rating: rating,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Rating Sent Successfully')),
      );

      context.pop();
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Give Rating'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(defaultPagePadding),
        child: ElevatedButton(
          onPressed: onFormSubmit,
          child: const Text('Submit'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPagePadding),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(hintText: 'Name'),
                      validator: (String? value) {
                        if (value?.isEmpty == true) {
                          return "Name is required";
                        }

                        if ((value?.length ?? 0) < 4) {
                          return "Name should atleast be 4 characters";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      controller: commentController,
                      maxLines: 6,
                      decoration: const InputDecoration(hintText: 'Comment'),
                      validator: (String? value) {
                        if (value?.isEmpty == true) {
                          return "Comment is required";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Share Your Experience in Shipping.',
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4),
                    RatingBar.builder(
                      initialRating: 4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      onRatingUpdate: (val) => setState(() => rating = val),
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
