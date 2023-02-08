// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class Body extends HookWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => _body();
}

class Section extends StatelessWidget {
  const Section({
    Key? key,
    required this.title,
    required this.icon,
    required this.children,
  }) : super(key: key);

  final String title;

  final IconData icon;

  final List<Widget> children;

  @override
  Widget build(BuildContext _context) => _section(
        title: title,
        icon: icon,
        children: children,
      );
}

class SectionHeader extends StatelessWidget {
  const SectionHeader(
    this.title,
    this.icon, {
    Key? key,
  }) : super(key: key);

  final String title;

  final IconData icon;

  @override
  Widget build(BuildContext _context) => _sectionHeader(
        _context,
        title,
        icon,
      );
}

class SectionPadding extends StatelessWidget {
  const SectionPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => _sectionPadding();
}

class ItemPadding extends StatelessWidget {
  const ItemPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => _itemPadding();
}

class ServiceSelector extends StatelessWidget {
  const ServiceSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => _serviceSelector();
}

class AccountTypeSelector extends StatelessWidget {
  const AccountTypeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => _accountTypeSelector();
}

class UnitNameSelector extends StatelessWidget {
  const UnitNameSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => _unitNameSelector();
}

class CountrySelector extends StatelessWidget {
  const CountrySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => _countrySelector();
}

class StateSelector extends StatelessWidget {
  const StateSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => _stateSelector();
}

class TextDropDown extends HookWidget {
  const TextDropDown(
    this.hintText,
    this.options,
    this.isRequired, {
    Key? key,
  }) : super(key: key);

  final String hintText;

  final List<String> options;

  final bool isRequired;

  @override
  Widget build(BuildContext _context) => _textDropDown(
        hintText,
        options,
        isRequired,
      );
}

class NotificationSelector extends HookWidget {
  const NotificationSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => _notificationSelector();
}
