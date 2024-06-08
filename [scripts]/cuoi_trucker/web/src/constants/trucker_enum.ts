export enum ETruckerTabId {
  Vehicles = "vehicles",
  Markets = "markets",
  Suppliers = "Suppliers",
}

export enum ETruckerMarketType {
  Store = "store",
  Clothes = "clothes",
  Machine = "machine",
}

export enum ESupplierCategories {
  Store = "store",
  Clothes = "clothes",
  Machine = "machine",
}

export const ESupplierCategoriesLabel = {
  [ESupplierCategories.Store]: "Tạp hóa",
  [ESupplierCategories.Clothes]: "Quần áo",
  [ESupplierCategories.Machine]: "Dụng cụ",
} as const;

export enum ESize {
  ExtremeLarge = "prop_box_wood08a",
  Large = "prop_box_wood04a",
  Medium = "prop_box_wood05a",
  Small = "prop_cardbordbox_04a",
  ExtremeSmall = "prop_cs_rub_box_02",
}

export const ESizeLabel = {
  [ESize.ExtremeLarge]: "Rất Lớn",
  [ESize.Large]: "Lớn",
  [ESize.Medium]: "Vừa",
  [ESize.Small]: "Nhỏ",
  [ESize.ExtremeSmall]: "Rất nhỏ",
} as const;
