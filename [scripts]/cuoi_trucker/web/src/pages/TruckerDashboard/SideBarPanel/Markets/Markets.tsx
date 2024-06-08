import { Grid, Typography, styled, useTheme } from "@mui/material";
import { useCallback, useEffect, useMemo, useState } from "react";
import { COLOR_PALLETTE, ESize, ESizeLabel } from "../../../../constants";
import { ITruckerMarket, ITruckerMarketItem } from "../../../../interfaces";
import { fetchNui } from "../../../../utils";
import { CustomAccordion } from "./CustomAccordion";
import { DialogDetailPrice } from "./DialogDetailPrice";
import { randomId } from "@mui/x-data-grid-generator";

const defaultListMarket = [
  {
    id: 1,
    type: "store",
    name: "Tạp hoá",
    list: [],
  },
  {
    id: 2,
    type: "clothes",
    name: "Cửa hàng quần áo",
    list: [],
  },
  {
    id: 3,
    type: "machine",
    name: "Cửa hàng dụng cụ",
    list: [],
  },
];

export const Markets = () => {
  const theme = useTheme();
  const [listMarket, setListMarket] =
    useState<ITruckerMarket[]>(defaultListMarket);
  const [DetailPriceInfo, setDetailPriceInfo] =
    useState<ITruckerMarketItem | null>(null);

  const handleOpenDialogDetailPrice = useCallback(
    (info: ITruckerMarketItem) => {
      setDetailPriceInfo(info);
    },
    []
  );

  const handleCloseDialogDetailPrice = useCallback(() => {
    setDetailPriceInfo(null);
  }, []);

  const renderCardsMarketComponent = useMemo(() => {
    return listMarket.map((market) => {
      return (
        <CustomAccordion
          key={market.id}
          market={market}
          onClickShowDetail={handleOpenDialogDetailPrice}
        />
      );
    });
  }, [listMarket, handleOpenDialogDetailPrice]);

  useEffect(() => {
    const fetchData = async () => {
      const marketsResponse = await fetchNui("getMarkets");
      const markets: ITruckerMarket[] = handleMarketsResponse(
        listMarket,
        marketsResponse
      );
      setListMarket(markets);
    };
    fetchData();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <Grid container rowGap={theme.spacing(16)} height={1}>
      {/* Title */}
      <Grid container>
        <TypographyStyle fontSize={theme.spacing(22)} fontWeight="bold">
          Thị trường
        </TypographyStyle>
      </Grid>

      {/* List Market */}
      <ListMarketStyle>
        <Grid container rowGap={theme.spacing(12)}>
          {renderCardsMarketComponent}
        </Grid>
      </ListMarketStyle>

      {/* Dialog Detail Price */}
      <DialogDetailPrice
        info={DetailPriceInfo}
        onClose={handleCloseDialogDetailPrice}
      />
    </Grid>
  );
};

const TypographyStyle = styled(Typography)({
  color: "#FFFFFF",
});

const ListMarketStyle = styled(Grid)(({ theme }) => ({
  overflowY: "auto",
  paddingRight: theme.spacing(10),
  height: `calc(100% - ${theme.spacing(54)})`,
  "&::-webkit-scrollbar": {
    width: theme.spacing(8),
  },
  "&::-webkit-scrollbar-track": {
    borderRadius: theme.spacing(4),
    background: COLOR_PALLETTE.GRAY_800,
  },
  "&::-webkit-scrollbar-thumb": {
    borderRadius: theme.spacing(4),
    background: COLOR_PALLETTE.GRAY_700,
  },
  "&::-webkit-scrollbar-thumb:hover": {
    background: "#FFFFFF",
  },
}));

const convertDetailPrice = (purchase: any) => {
  const result = Object.entries(purchase).map(([key, price]: any) => {
    const size = Object.values(ESize).find((size) => size === key) as ESize;
    return {
      id: randomId(),
      size: ESizeLabel[size],
      price: price.toString(),
    };
  });

  return Object.values(ESizeLabel).map((label) => {
    const item = result.find((item) => item.size === label);
    return item || { id: randomId(), size: label, price: "0" };
  });
};

const handleMarketsResponse = (
  listMarket: ITruckerMarket[],
  marketsResponse: any
) => {
  return listMarket.map((item) => {
    const newList = marketsResponse
      ?.filter((market: any) => market.type === item.type)
      .map((item: any) => ({
        ...item,
        detailPrice: convertDetailPrice(item.purchase),
      }));

    return {
      ...item,
      list: newList,
    };
  });
};
