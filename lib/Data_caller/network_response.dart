class NetworkResponse{
  final int? stutusCode;
  final bool isSuccess;
  final dynamic jsonResponse;
  final String? errorMessege;

  const NetworkResponse({ this.stutusCode=-1,
    required this.isSuccess,
    this.jsonResponse,
    this.errorMessege='Something went wrong'
  });
}