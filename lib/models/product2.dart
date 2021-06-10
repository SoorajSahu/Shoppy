// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString?);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    this.payload,
    this.error,
    this.timestamp,
  });

  Payload? payload;
  dynamic? error;
  dynamic? timestamp;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        payload: Payload.fromJson(json["payload"]),
        error: json["error"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "payload": payload!.toJson(),
        "error": error,
        "timestamp": timestamp,
      };
}

class Payload {
  Payload({
    this.content,
    this.pageable,
    this.totalElements,
    this.last,
    this.totalPages,
    this.first,
    this.sort,
    this.numberOfElements,
    this.size,
    this.number,
    this.empty,
  });

  List<Content>? content;
  Pageable? pageable;
  dynamic? totalElements;
  bool? last;
  dynamic? totalPages;
  bool? first;
  Sort? sort;
  dynamic? numberOfElements;
  dynamic? size;
  dynamic? number;
  bool? empty;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        totalElements: json["totalElements"],
        last: json["last"],
        totalPages: json["totalPages"],
        first: json["first"],
        sort: Sort.fromJson(json["sort"]),
        numberOfElements: json["numberOfElements"],
        size: json["size"],
        number: json["number"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content!.map((x) => x.toJson())),
        "pageable": pageable!.toJson(),
        "totalElements": totalElements,
        "last": last,
        "totalPages": totalPages,
        "first": first,
        "sort": sort!.toJson(),
        "numberOfElements": numberOfElements,
        "size": size,
        "number": number,
        "empty": empty,
      };
}

class Content {
  Content({
    this.createdAt,
    this.updatedAt,
    this.superProdSku,
    this.prodSku,
    this.brand,
    this.displayName,
    this.thumbnail,
    this.rank,
    this.rootCatSlug,
    this.catSlug,
    this.mrp,
    this.catName,
    this.orgId,
    this.taxGroup,
    this.qty,
    this.salePrice,
    this.productVariants,
    this.spTaxIncluded,
    this.showOnline,
  });

  String? createdAt;
  String? updatedAt;
  String? superProdSku;
  String? prodSku;
  String? brand;
  String? displayName;
  String? thumbnail;
  dynamic? rank;
  dynamic? rootCatSlug;
  String? catSlug;
  double? mrp;
  String? catName;
  dynamic? orgId;
  TaxGroup? taxGroup;
  dynamic? qty;
  double? salePrice;
  List<ProductVariant>? productVariants;
  bool? spTaxIncluded;
  bool? showOnline;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        superProdSku: json["super_prod_sku"],
        prodSku: json["prod_sku"],
        brand: json["brand"] == null ? null : json["brand"],
        displayName: json["display_name"],
        thumbnail: json["thumbnail"],
        rank: json["rank"],
        rootCatSlug: json["root_cat_slug"],
        catSlug: json["cat_slug"],
        mrp: json["mrp"],
        catName: json["cat_name"] == null ? null : json["cat_name"],
        orgId: json["org_id"],
        taxGroup: TaxGroup.fromJson(json["tax_group"]),
        qty: json["qty"],
        salePrice: json["sale_price"],
        productVariants: List<ProductVariant>.from(
            json["product_variants"].map((x) => ProductVariant.fromJson(x))),
        spTaxIncluded: json["sp_tax_included"],
        showOnline: json["show_online"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "updated_at": updatedAt,
        "super_prod_sku": superProdSku,
        "prod_sku": prodSku,
        "brand": brand == null ? null : brand,
        "display_name": displayName,
        "thumbnail": thumbnail,
        "rank": rank,
        "root_cat_slug": rootCatSlug,
        "cat_slug": catSlug,
        "mrp": mrp,
        "cat_name": catName == null ? null : catName,
        "org_id": orgId,
        "tax_group": taxGroup!.toJson(),
        "qty": qty,
        "sale_price": salePrice,
        "product_variants":
            List<dynamic>.from(productVariants!.map((x) => x.toJson())),
        "sp_tax_included": spTaxIncluded,
        "show_online": showOnline,
      };
}

class ProductVariant {
  ProductVariant({
    this.prodSku,
    this.displayName,
    this.thumbnail,
    this.mrp,
    this.qty,
    this.salePrice,
    this.extraProductFields,
    this.showOnline,
  });

  String? prodSku;
  String? displayName;
  String? thumbnail;
  double? mrp;
  dynamic? qty;
  double? salePrice;
  List<ExtraProductField>? extraProductFields;
  bool? showOnline;

  factory ProductVariant.fromJson(Map<String, dynamic> json) => ProductVariant(
        prodSku: json["prod_sku"],
        displayName: json["display_name"],
        thumbnail: json["thumbnail"],
        mrp: json["mrp"],
        qty: json["qty"],
        salePrice: json["sale_price"],
        extraProductFields: List<ExtraProductField>.from(
            json["extra_product_fields"]
                .map((x) => ExtraProductField.fromJson(x))),
        showOnline: json["show_online"],
      );

  Map<String, dynamic> toJson() => {
        "prod_sku": prodSku,
        "display_name": displayName,
        "thumbnail": thumbnail,
        "mrp": mrp,
        "qty": qty,
        "sale_price": salePrice,
        "extra_product_fields":
            List<dynamic>.from(extraProductFields!.map((x) => x.toJson())),
        "show_online": showOnline,
      };
}

class ExtraProductField {
  ExtraProductField({
    this.efId,
    this.slug,
    this.name,
    this.type,
    this.val,
  });

  dynamic? efId;
  Slug? slug;
  Name? name;
  Type? type;
  String? val;

  factory ExtraProductField.fromJson(Map<String, dynamic> json) =>
      ExtraProductField(
        efId: json["ef_id"],
        slug: slugValues.map[json["slug"]],
        name: nameValues.map[json["name"]],
        type: typeValues.map[json["type"]],
        val: json["val"],
      );

  Map<String, dynamic> toJson() => {
        "ef_id": efId,
        "slug": slugValues.reverse[slug],
        "name": nameValues.reverse[name],
        "type": typeValues.reverse[type],
        "val": val,
      };
}

enum Name { CATEGORY }

final nameValues = EnumValues({"Category": Name.CATEGORY});

enum Slug { CATEGORY }

final slugValues = EnumValues({"category": Slug.CATEGORY});

enum Type { TEXT }

final typeValues = EnumValues({"TEXT": Type.TEXT});

class TaxGroup {
  TaxGroup({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.name,
    this.cgst,
    this.igst,
    this.sgst,
    this.utgst,
    this.total,
  });

  String? createdAt;
  String? updatedAt;
  String? id;
  String? name;
  double? cgst;
  dynamic? igst;
  double? sgst;
  dynamic? utgst;
  dynamic? total;

  factory TaxGroup.fromJson(Map<String, dynamic> json) => TaxGroup(
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        cgst: json["cgst"].toDouble(),
        igst: json["igst"],
        sgst: json["sgst"].toDouble(),
        utgst: json["utgst"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "cgst": cgst,
        "igst": igst,
        "sgst": sgst,
        "utgst": utgst,
        "total": total,
      };
}

class Pageable {
  Pageable({
    this.sort,
    this.pageNumber,
    this.pageSize,
    this.offset,
    this.unpaged,
    this.paged,
  });

  Sort? sort;
  dynamic? pageNumber;
  dynamic? pageSize;
  dynamic? offset;
  bool? unpaged;
  bool? paged;

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        offset: json["offset"],
        unpaged: json["unpaged"],
        paged: json["paged"],
      );

  Map<String, dynamic> toJson() => {
        "sort": sort!.toJson(),
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "offset": offset,
        "unpaged": unpaged,
        "paged": paged,
      };
}

class Sort {
  Sort({
    this.unsorted,
    this.sorted,
    this.empty,
  });

  bool? unsorted;
  bool? sorted;
  bool? empty;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        unsorted: json["unsorted"],
        sorted: json["sorted"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "unsorted": unsorted,
        "sorted": sorted,
        "empty": empty,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
