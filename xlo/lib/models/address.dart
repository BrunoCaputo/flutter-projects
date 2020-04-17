class Address {
	Address({
		this.place,
		this.district,
		this.city,
		this.postalCode,
		this.federativeUnit
	});

	String place;
	String district;
	String city;
	String postalCode;
	String federativeUnit;

	@override
	String toString() {
	if (place.isEmpty) {
		if (district.isEmpty) return '$city, $postalCode, $federativeUnit';
		return '$district, $city, $postalCode, $federativeUnit';
	}
	if (district.isEmpty)
		return '$district, $city, $postalCode, $federativeUnit';
	return '$place, $district, $city, $postalCode, $federativeUnit';
	}
}
