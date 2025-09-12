import 'package:puremvc/puremvc.dart';
import 'package:employee_admin/controller/prep_model_command.dart';
import 'package:employee_admin/controller/prep_view_command.dart';

class StartupCommand extends MacroCommand {

  @override
  void initializeMacroCommand() {
    addSubCommand(() => PrepModelCommand());
    addSubCommand(() => PrepViewCommand());
  }

}