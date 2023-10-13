abstract class UseCase<Param, Result> {
  Result call({
    required Param param,
  });
}
