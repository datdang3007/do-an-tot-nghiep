export interface ITruckerSupplierItem {
  id: number;
  name: string;
  image: string;
  distance: string;
  subTitle: string;
}

export interface ITruckerSupplier {
  id: number;
  name: string;
  list: ITruckerSupplierItem[];
}
