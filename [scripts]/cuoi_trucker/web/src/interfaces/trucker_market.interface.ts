export interface ITruckerMarketItem {
  id: number;
  name: string;
  code: string;
  type: string;
  image: string;
  amount: number;
  position: string;
  distance: string;
  subTitle: string;
}

export interface ITruckerMarket {
  id: number;
  name: string;
  type: string;
  list: ITruckerMarketItem[];
}
