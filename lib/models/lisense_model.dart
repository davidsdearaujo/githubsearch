class LicenseModel {
  String key;
  String name;
  String spdxId;
  dynamic url;
  String nodeId;

  LicenseModel({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  factory LicenseModel.fromJson(Map<String, dynamic> json) {
    if (json == null)
      return null;
    else
      return LicenseModel(
        key: json["key"],
        name: json["name"],
        spdxId: json["spdx_id"],
        url: json["url"],
        nodeId: json["node_id"],
      );
  }

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "spdx_id": spdxId,
        "url": url,
        "node_id": nodeId,
      };
}
