abstract class Newssatate{}
class Newsinitstates extends Newssatate{}
class NewsbottomNavstates extends Newssatate{}
class NewsGetBusinesLoadingstates extends Newssatate{}
class NewsGetBusinesSuccessStates extends Newssatate{}
class NewsGetBusinesErrorStates extends Newssatate{
  final String ereor;
  NewsGetBusinesErrorStates(this.ereor);
}