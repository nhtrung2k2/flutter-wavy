enum ItemInputSalaryId { Transportation, Parking, Meal, Other }

String convertIdToName(int id) {
  return ItemInputSalaryId.values[id - 1].name;
}
