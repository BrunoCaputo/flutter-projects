import 'package:flutter/material.dart';
import 'package:xlo/models/ad.dart';

class UserPanel extends StatelessWidget {
	const UserPanel(this.ad);

	final Ad ad;

	@override
	Widget build(BuildContext context) {
		return Column(
			crossAxisAlignment: CrossAxisAlignment.stretch,
			children: <Widget>[
				Padding(
					padding: const EdgeInsets.symmetric(vertical: 18),
					child: Text(
						'Anunciante',
						style: TextStyle(
							fontSize: 17,
							fontWeight: FontWeight.w600
						),
					),
				),
				Container(
					padding: const EdgeInsets.all(16),
					color: Colors.grey[200],
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							Text(
								'Bruno',
								style: TextStyle(
									color: Colors.black,
									fontSize: 20,
									fontWeight: FontWeight.w600
								),
							),
							const SizedBox(height: 10,),
							Text(
								'NA OLX desde hoje',
								style: TextStyle(
									color: Colors.grey
								),
							)
						],
					),
				)
			],
		);
	}
}
