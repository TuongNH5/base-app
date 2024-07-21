
import 'package:myutils/constants/api_constant.dart';
import 'package:myutils/data/network/base_repository.dart';

import '../network/model/output/on_boarding_output.dart';

///Created by Nguyen Huu Tuong on 01/06/2022.

class NewsEventsRepository extends BaseRepository {
  NewsEventsRepository() : super(ApiService.news_events);


  Future<OnBoardingOutput> getOnboarding() async {
    return OnBoardingOutput.fromJson(
        await request(method: RequestMethod.get, path: '/on-boarding'));
  }


}
