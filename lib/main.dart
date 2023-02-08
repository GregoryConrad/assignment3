import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'main.g.dart';

void main() {
  runApp(MaterialApp(
    title: 'HCI Assignment 3',
    theme: FlexThemeData.light(
      scheme: FlexScheme.brandBlue,
      useMaterial3: true,
    ),
    darkTheme: FlexThemeData.dark(
      scheme: FlexScheme.brandBlue,
      useMaterial3: true,
    ),
    home: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: const Body(),
          ),
        ),
      ),
    ),
  ));
}

@hwidget
Widget _body() {
  final formKey = useFormKey();
  return Form(
    key: formKey,
    child: Column(children: [
      const SectionPadding(),
      Section(title: 'Your Name', icon: Icons.person, children: [
        TextFormField(
          validator: requiredValidator,
          decoration: const InputDecoration(
            labelText: '* First Name',
            hintText: 'e.g. John',
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Middle Initial',
            hintText: 'e.g. A',
          ),
        ),
        TextFormField(
          validator: requiredValidator,
          decoration: const InputDecoration(
            labelText: '* Last Name',
            hintText: 'e.g. Smith',
          ),
        ),
      ]),
      Section(title: 'Your Service', icon: Icons.local_police, children: [
        Row(children: const [
          Flexible(flex: 5, child: ServiceSelector()),
          SizedBox(width: 16),
          Flexible(flex: 3, child: AccountTypeSelector()),
        ]),
        Row(children: [
          const Flexible(flex: 3, child: UnitNameSelector()),
          const SizedBox(width: 16),
          Column(children: [
            const Text('Unit not listed?'),
            TextButton(
              child: const Text('Click here'),
              onPressed: () {},
            ),
          ]),
        ]),
      ]),
      Section(
        title: 'Your Work Address',
        icon: Icons.location_on,
        children: [
          const CountrySelector(),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Address',
              hintText: 'e.g. 1234 Main Rd',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Address 2',
              hintText: 'e.g. Apt D',
            ),
          ),
          Row(children: [
            Flexible(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'City',
                  hintText: 'e.g. Boston',
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Flexible(
              child: StateSelector(),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Postal Code',
                  hintText: 'e.g. 01234',
                ),
              ),
            ),
          ]),
        ],
      ),
      Section(
        title: 'Your Contact Information',
        icon: Icons.contact_mail,
        children: [
          TextFormField(
            keyboardType: TextInputType.phone,
            validator: requiredValidator,
            decoration: const InputDecoration(
              labelText: '* Primary Phone Number',
              hintText: 'e.g. 1234567890',
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Alternate Phone Number',
              hintText: 'e.g. 1234567890',
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: requiredValidator,
            decoration: const InputDecoration(
              labelText: '* Primary Email Address',
              hintText: 'e.g. jsmith@army.mil',
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Alternate Email Address',
              hintText: 'e.g. jsmith@army.mil',
            ),
          ),
        ],
      ),
      const Section(
        title: 'Your Notifications',
        icon: Icons.notifications,
        children: [
          Text('Select which notifications you would like to receive.'),
          NotificationSelector(),
        ],
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.cancel),
          label: const Text('Cancel'),
          onPressed: () => formKey.currentState?.reset(),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          icon: const Icon(Icons.save),
          label: const Text('Save'),
          onPressed: () => formKey.currentState?.validate(),
        ),
      ]),
      const SectionPadding(),
    ]),
  );
}

@swidget
Widget _section({
  required String title,
  required IconData icon,
  required List<Widget> children,
}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    SectionHeader(title, icon),
    for (final child in children) ...[
      const ItemPadding(),
      child,
    ],
    const SectionPadding(),
  ]);
}

@swidget
Widget _sectionHeader(BuildContext context, String title, IconData icon) {
  return Row(children: [
    Icon(icon),
    const SizedBox(width: 16),
    Text(title, style: context.textTheme.titleLarge),
  ]);
}

@swidget
Widget _sectionPadding() => const SizedBox(height: 64);

@swidget
Widget _itemPadding() => const SizedBox(height: 16);

@swidget
Widget _serviceSelector() {
  const services = [
    'Army',
    'Army Reserve',
    'Amy National Guard',
    'Marine Corps',
    'Marine Corps Reserve',
    'Navy',
    'Navy Reserve',
    'Air Force',
    'Air Force Reserve',
    'Air National Guard',
    'Coast Guard',
    'Coast Guard Reserve',
  ];
  return const TextDropDown('* Service', services, true);
}

@swidget
Widget _accountTypeSelector() {
  const accountTypes = [
    'DA Civilian',
    'Civilian',
    'Military',
    'Contractor',
  ];
  return const TextDropDown('* Account Type', accountTypes, true);
}

@swidget
Widget _unitNameSelector() {
  const unitNames = [
    '115 AS - McChord, WA',
    '130 AS - Charleston, WV',
    '193 SOG - Harrisburg, PA',
    '29 WIC - Little Rock, AK',
    'LNDG SPT CO BN CLR , Japan',
    'Other - Air Mobility Command, A3',
    'Other - USMC',
    'Other',
  ];
  return const TextDropDown('* Unit Name', unitNames, true);
}

@swidget
Widget _countrySelector() {
  const countries = [
    'United States',
    'Other',
  ];
  return const TextDropDown('Country', countries, false);
}

@swidget
Widget _stateSelector() {
  const states = [
    'AL',
    'AK',
    'AZ',
    'AR',
    'CA',
    'CO',
    'CT',
    'DE',
    'DC',
    'FL',
    'GA',
    'HI',
    'ID',
    'IL',
    'IN',
    'IA',
    'KS',
    'KY',
    'LA',
    'ME',
    'MD',
    'MA',
    'MI',
    'MN',
    'MS',
    'MO',
    'MT',
    'NE',
    'NV',
    'NH',
    'NJ',
    'NM',
    'NY',
    'NC',
    'ND',
    'OH',
    'OK',
    'OR',
    'PA',
    'RI',
    'SC',
    'SD',
    'TN',
    'TX',
    'UT',
    'VT',
    'VA',
    'WA',
    'WV',
    'WI',
    'WY',
  ];
  return const TextDropDown('Region/State', states, false);
}

@hwidget
Widget _textDropDown(String hintText, List<String> options, bool isRequired) {
  final selection = useState<String?>(null);
  return DropdownButtonFormField<String>(
    isExpanded: true,
    hint: Text(hintText),
    value: selection.value,
    onChanged: (s) => selection.value = s,
    validator: isRequired ? requiredValidator : null,
    items: options
        .map(
          (e) => DropdownMenuItem(value: e, child: Text(e)),
        )
        .toList(),
  );
}

@hwidget
Widget _notificationSelector() {
  const notificationTypes = [
    'Individual Map File Update',
    'New Prepared Terrain Package',
    'New Software Versions',
    'New Tutorial',
    'New Manuals',
    'Other',
  ];

  final selectedNotifications = useState(<String>{});
  return Wrap(spacing: 8, runSpacing: 8, children: [
    for (final notification in notificationTypes) ...[
      FilterChip(
        label: Text(notification),
        selected: selectedNotifications.value.contains(notification),
        onSelected: (isSelected) {
          selectedNotifications.value = () {
            if (isSelected) {
              return selectedNotifications.value
                  .unmodifiableCopyWithAdd(notification);
            } else {
              return selectedNotifications.value
                  .unmodifiableCopyWithRemove(notification);
            }
          }();
        },
      ),
    ],
  ]);
}

String? requiredValidator(String? value) {
  final isNotSet = value?.isEmpty ?? true;
  return isNotSet ? 'Field is required.' : null;
}

extension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}

extension SetCopyWith<T> on Set<T> {
  Set<T> copyWithAdd(T value) => Set.of(this)..add(value);

  Set<T> unmodifiableCopyWithAdd(T value) =>
      Set.unmodifiable(copyWithAdd(value));

  Set<T> copyWithRemove(T value) => Set.of(this)..remove(value);

  Set<T> unmodifiableCopyWithRemove(T value) =>
      Set.unmodifiable(copyWithRemove(value));
}

GlobalKey<FormState> useFormKey() => useRef(GlobalKey<FormState>()).value;

void useValidateAfterFirstFrame(GlobalKey<FormState> formKey) {
  useEffect(() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      formKey.currentState?.validate();
    });
    return null;
  }, const []);
}

GlobalKey<FormState> useValidatedAfterFirstFrameFormKey() {
  final key = useFormKey();
  useValidateAfterFirstFrame(key);
  return key;
}
