import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchTextField extends HookWidget {
  const SearchTextField({
    super.key,
    required this.searchBuilder,
    required this.list,
    this.onSubmit,
  });

  final void Function(String searchTerm)? onSubmit;

  final List<Widget> Function(
    BuildContext context,
    String searchTerm,
  ) searchBuilder;
  final ValueNotifier<List<Widget>> list;

  @override
  Widget build(BuildContext context) {
    final isTextField = useState(false);
    final inputFocusNode = useFocusNode();
    final controller = useTextEditingController();

    useEffect(() {
      inputFocusNode.addListener(
        () => focusNodeListener(inputFocusNode, controller, isTextField),
      );

      return () {
        inputFocusNode.removeListener(
          () => focusNodeListener(inputFocusNode, controller, isTextField),
        );
      };
    }, []);

    return HookBuilder(
      builder: (context) {
        final sizeAnimationController = useAnimationController(
          lowerBound: .2,
          initialValue: .2,
          upperBound: 1,
          duration: const Duration(
            milliseconds: 500,
          ),
          reverseDuration: const Duration(milliseconds: 250),
        );

        final sizeAnimation = useAnimation(
          CurvedAnimation(
            parent: sizeAnimationController,
            curve: Curves.ease,
            reverseCurve: Curves.easeOut,
          ),
        );

        useEffect(() {
          if (isTextField.value) {
            sizeAnimationController.forward();
          } else {
            sizeAnimationController.reverse();
          }
          return null;
        }, [isTextField.value]);

        return SizedBox(
          height: 45,
          width: sizeAnimation * 150,
          child: TextField(
            controller: controller,
            onChanged: (searchTerm) {
              if (searchTerm.isNotEmpty) {
                list.value = searchBuilder(context, searchTerm);
                return;
              }

              list.value = [];
            },
            onSubmitted: (searchTerm) {
              if (onSubmit != null && searchTerm.isNotEmpty) {
                onSubmit!(searchTerm);
              }
            },
            focusNode: inputFocusNode,
            textAlignVertical: TextAlignVertical.top,
            decoration: const InputDecoration(
              prefixIcon: Hero(
                tag: 'search',
                child: Icon(Icons.search),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 0.1),
              ),
            ),
          ),
        );
      },
    );
  }

  void focusNodeListener(FocusNode inputFocusNode,
      TextEditingController controller, ValueNotifier<bool> isTextField) {
    if (!inputFocusNode.hasFocus && controller.text.isEmpty) {
      isTextField.value = false;
    }

    isTextField.value = inputFocusNode.hasFocus;
  }
}
