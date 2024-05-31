import { Grid, Typography, styled, useTheme } from "@mui/material";
import { useCallback, useMemo, useState } from "react";
import { COLOR_PALLETTE } from "../../../../constants";
import { ITruckerMarket, ITruckerMarketItem } from "../../../../interfaces";
import { CustomAccordion } from "./CustomAccordion";
import { DialogDetailPrice } from "./DialogDetailPrice";

const listTruckerMarket: ITruckerMarket[] = [
  {
    id: 1,
    name: "Tạp hoá",
    list: [
      {
        id: 1,
        distance: "7",
        name: "Tạp hoá 1",
        subTitle: "Thu mua các loại nhu yếu phẩm",
        image: "https://i.ytimg.com/vi/ZM2DhD6C0U8/maxresdefault.jpg",
      },
    ],
  },
  {
    id: 2,
    name: "Cửa hàng quần áo",
    list: [
      {
        id: 1,
        distance: "5",
        name: "Cửa hàng quần áo 1",
        subTitle: "Thu mua các loại quần áo",
        image:
          "https://dunb17ur4ymx4.cloudfront.net/wysiwyg/1031918/527d4eabadff1f04fca5052ca0c6e9e2a2821fb3.PNG",
      },
    ],
  },
  {
    id: 3,
    name: "Cửa hàng dụng cụ",
    list: [
      {
        id: 1,
        distance: "10",
        name: "Cửa hàng dụng cụ 1",
        subTitle: "Thu mua các loại dụng cụ",
        image:
          "https://s3-gallery.int-cdn.lcpdfrusercontent.com/monthly_2017_05/large.592b6c6549a33_youtool.jpg.638b19e33c31ca357f9b441a15f13b87.jpg",
      },
    ],
  },
];

export const Markets = () => {
  const theme = useTheme();
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
    return listTruckerMarket.map((market) => {
      return (
        <CustomAccordion
          key={market.id}
          market={market}
          onClickShowDetail={handleOpenDialogDetailPrice}
        />
      );
    });
  }, [handleOpenDialogDetailPrice]);

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
