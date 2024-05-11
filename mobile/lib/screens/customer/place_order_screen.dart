import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logitech/router/routes.dart';
import 'package:logitech/services/order.dart';
import 'package:logitech/state/order/orders_provider.dart';
import 'package:logitech/theme/theme.dart';

class PlaceOrderScreenArgs {
  final String startAddress;
  final String destinationAddress;
  final (double, double) startCoordinates;
  final (double, double) destinationCoordinates;
  final double totalDistance;
  final double totalCost;
  final Set<(String, LatLng)> hubs;

  PlaceOrderScreenArgs({
    required this.startAddress,
    required this.destinationAddress,
    required this.startCoordinates,
    required this.destinationCoordinates,
    required this.totalDistance,
    required this.totalCost,
    required this.hubs,
  });
}

class PlaceOrderScreen extends ConsumerStatefulWidget {
  final Object? args;
  const PlaceOrderScreen(this.args, {super.key});

  @override
  ConsumerState<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends ConsumerState<PlaceOrderScreen> {
  int currentStep = 0;
  String vehicleType = 'Goods Container (Opened)';
  final locationDetailsFormKey = GlobalKey<FormState>();
  final goodsDetailsFormKey = GlobalKey<FormState>();
  TextEditingController startController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController goodsTypeController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController distanceController = TextEditingController();
  TextEditingController costController = TextEditingController();
  PlaceOrderScreenArgs? args;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.args is PlaceOrderScreenArgs) {
        args = widget.args as PlaceOrderScreenArgs;
        startController.text = args?.startAddress ?? '';
        destinationController.text = args?.destinationAddress ?? '';
        distanceController.text = args?.totalDistance.toStringAsFixed(2) ?? '';
        costController.text = args?.totalCost.toStringAsFixed(2) ?? '';
        setState(() {});
      } else {
        throw Exception('PlaceOrderScreenArgs is not passed');
      }
    });
  }

  Future<void> onFinish() async {
    if (locationDetailsFormKey.currentState?.validate() == false) {
      setState(() => currentStep = 1);
      return;
    }

    if (goodsDetailsFormKey.currentState?.validate() == false) {
      setState(() => currentStep = 2);
      return;
    }

    try {
      await OrderService.createOrder(
        vehicleType: vehicleType,
        startAddress: startController.text,
        destinationAddress: destinationController.text,
        approxWeight: weightController.text,
        startLatitude: args?.startCoordinates.$1 ?? 0,
        startLongitude: args?.startCoordinates.$2 ?? 0,
        destinationLatitude: args?.destinationCoordinates.$1 ?? 0,
        destinationLongitude: args?.destinationCoordinates.$2 ?? 0,
        hubs: args?.hubs,
        typeOfGoods: goodsTypeController.text,
        deliveryNote: noteController.text,
        totalCost: costController.text,
        totalDistance: distanceController.text,
      );

      ref.read(ordersProvider.notifier).invalidate();
      if (!mounted) return;
      context.goNamed(Routes.orderConfirmed);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  List<Step> getSteps() {
    return [
      Step(
        title: const Text('Vehicle Type'),
        isActive: currentStep >= 0,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'What kind of vehicle do you need for transportation ?',
            ),
            const SizedBox(height: 12),
            RadioListTile<String>(
              title: const Text('Goods Container (Opened)'),
              value: 'Goods Container (Opened)',
              groupValue: vehicleType,
              onChanged: (value) => setState(() => vehicleType = value!),
              contentPadding: const EdgeInsets.all(0),
            ),
            RadioListTile<String>(
              title: const Text('Goods Container (Closed)'),
              value: 'Goods Container (Closed)',
              groupValue: vehicleType,
              onChanged: (value) => setState(() => vehicleType = value!),
              contentPadding: const EdgeInsets.all(0),
            ),
            RadioListTile<String>(
              title: const Text('Refrigerated Container'),
              value: 'Refrigerated Container',
              groupValue: vehicleType,
              onChanged: (value) => setState(() => vehicleType = value!),
              contentPadding: const EdgeInsets.all(0),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
      Step(
        title: const Text('Location Details'),
        isActive: currentStep >= 1,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Please, Tell us the exact location to ship the goods, Add a Note if required.',
            ),
            const SizedBox(height: 12),
            Form(
              key: locationDetailsFormKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    controller: startController,
                    decoration: const InputDecoration(
                      hintText: 'Start Address',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty == true) {
                        return "Start Address is required";
                      }

                      if ((value?.length ?? 0) < 10) {
                        return "Start Address should be atleast 10 characters";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    controller: destinationController,
                    decoration: const InputDecoration(
                      hintText: 'Destination Address',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty == true) {
                        return "Destination Address is required";
                      }

                      if ((value?.length ?? 0) < 10) {
                        return "Destination Address should be atleast 10 characters";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    maxLines: 2,
                    keyboardType: TextInputType.text,
                    controller: noteController,
                    decoration: const InputDecoration(
                      hintText: 'Delivery Note',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    readOnly: true,
                    controller: distanceController,
                    decoration: const InputDecoration(
                      hintText: 'Total Distance',
                      suffixText: 'Km',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty == true) {
                        return "Total Distance is required";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
      Step(
        title: const Text('Goods Details'),
        isActive: currentStep >= 2,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What kind of goods are you shipping ?',
            ),
            const SizedBox(height: 12),
            Form(
              key: goodsDetailsFormKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Type Of Goods',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty == true) {
                        return "Type Of Goods is required";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: weightController,
                    decoration: const InputDecoration(
                      hintText: 'Approx Weight (Kg)',
                      suffixText: 'Kg',
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty == true) {
                        return "Weight is required";
                      }

                      if ((int.tryParse(value ?? '0') ?? 0) > 25000) {
                        return "Weight should be less than 25 Ton";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
      Step(
        title: const Text('Estimated Payment'),
        isActive: currentStep >= 3,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextFormField(
              readOnly: true,
              controller: costController,
              decoration: const InputDecoration(
                hintText: 'Total Estimated Cost',
                suffixText: '₹',
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              readOnly: true,
              controller: distanceController,
              decoration: const InputDecoration(
                hintText: 'Total Distance',
                suffixText: 'Km',
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    bool isLastStep = currentStep == 3;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Order'),
      ),
      body: Stepper(
        type: StepperType.vertical,
        steps: getSteps(),
        currentStep: currentStep,
        onStepTapped: (value) => setState(() => currentStep = value),
        onStepContinue: () => setState(() => currentStep++),
        onStepCancel: () => setState(() => currentStep--),
        controlsBuilder: (context, details) {
          return Row(
            children: [
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: isLastStep ? onFinish : details.onStepContinue,
                  child: Text(isLastStep ? 'Finish' : 'Next'),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: currentStep == 0 ? null : details.onStepCancel,
                  style: secondaryButtonStyle,
                  child: const Text('Back'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
