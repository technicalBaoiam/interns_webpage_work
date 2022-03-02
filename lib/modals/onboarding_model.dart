class OnboardingModel {
  String image, desc;
  OnboardingModel({required this.image, required this.desc});
}

List<OnboardingModel> getOnboardingPages() {
  List<OnboardingModel> onboardingPages = [
    OnboardingModel(image: 'baoiam', desc: 'Shape your future with us'),
    OnboardingModel(
        image: '2',
        desc: 'Learning platform for academic and professional courses'),
    OnboardingModel(
        image: '4', desc: 'Improve your skills and scores via master classes'),
    OnboardingModel(
        image: 'study',
        desc: 'Your future is at our hands now. Join the discussion anytime.'),
  ];
  return onboardingPages;
}
