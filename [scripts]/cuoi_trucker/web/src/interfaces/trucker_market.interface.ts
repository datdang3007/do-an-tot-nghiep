export interface ITruckerMarketItem {
  id: number;
  name: string;
  image: string;
  distance: string;
  subTitle: string;
}

export interface ITruckerMarket {
  id: number;
  name: string;
  list: ITruckerMarketItem[];
}
