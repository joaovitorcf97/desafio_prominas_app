// ignore_for_file: public_member_api_docs, sort_constructors_first
class FormItem {
  final String value;
  final String? error;

  const FormItem({this.value = '', this.error});

  FormItem copyWith({
    String? value,
    String? error,
  }) {
    return FormItem(
      value: value ?? this.value,
      error: error ?? this.error,
    );
  }
}
