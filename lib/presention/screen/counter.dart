import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/counter/counter_cubit.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<CounterCubit>(context);

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Counter", style: TextStyle(fontSize: 50)),
              SizedBox(height: 10),
              Text(cubit.counter.toString(), style: TextStyle(fontSize: 40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      cubit.increment();
                    },
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 25, color: Colors.green),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      cubit.reset();
                    },
                    child: Text(
                      "R",
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      cubit.decrement();
                    },
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 25, color: Colors.amber),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
