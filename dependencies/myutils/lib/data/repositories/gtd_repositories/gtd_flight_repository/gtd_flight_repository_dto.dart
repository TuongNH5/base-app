library gtd_flight_repository_dto;

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/request/add_booking_traveller_rq.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/gtd_all_filter_options_rs.dart';
import 'package:myutils/data/configuration/color_config/color_status.dart';
import 'package:myutils/data/repositories/gtd_api_client/booking_resource/models/response/search_booking_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/draft_booking_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/inventory_resource/models/response/gtd_insurance_plans_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/meta_resource.dart';
import 'package:myutils/data/repositories/gtd_api_client/meta_resource/models/json_models/base_fare.dart';
import 'package:myutils/data/repositories/gtd_repositories/common_enum/gtd_gender.dart';
import 'package:myutils/data/repositories/gtd_repositories/gtd_flight_repository/models/gtd_flight_search_result_dto.dart';
import 'package:myutils/data/repositories/gtd_api_client/air_tickets_resource/models/response/ssr_offers_rs.dart';
import 'package:myutils/data/repositories/gtd_api_client/booking_resource/models/response/booking_detail_rs.dart';

part 'dto/all_filter_options_dto.dart';
part 'dto/booking_status_color.dart';
part 'dto/draft_booking_dto.dart';
part 'dto/ssr_offer_dto.dart';
part 'dto/traveler_input_info_dto.dart';
