class Config {
  static const Base_URL = "https://bdtender.com/api/";

  //static const Base_URL = "https://3.109.36.149/";
  static const CORRIGEN_REPO = Base_URL + "count-corrigendum-tender";
  static const Live_REPO = Base_URL + "count-live-tender";
  static const PRIVATE_REPO = Base_URL + "count-private_tenders";
  static const TODAY_REPO = Base_URL + "count-todays-tender";

  static const CORRIGEN_DETAILS = Base_URL + "today-corrigendum";
  static const PRIVATE_DETAILS = Base_URL + "own-tender-notice";
  static const LIVE_DETAILS = Base_URL + "live-tender";
  static const TODAY_DETAILS = Base_URL + "today-tender";

  static const LOGIN = Base_URL + "login";
  static const SAVE_TENDER = Base_URL + "save-wish-list";
  static const SHOW_SAVE_TENDER = Base_URL + "show-wish-list";
  static const DELETE_SAVE_TENDER = Base_URL + "delete-wish-list";

  static const CATEGORY_GROUP = Base_URL + "top-categorygroup";
  static const OPTION = Base_URL + "catgrouphead-related-check";

  static const Registration = Base_URL + "register";
}
