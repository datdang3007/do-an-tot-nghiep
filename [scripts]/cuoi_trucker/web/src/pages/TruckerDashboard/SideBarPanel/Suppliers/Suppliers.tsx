import { Grid, Typography, styled, useTheme } from "@mui/material";
import { useMemo } from "react";
import { COLOR_PALLETTE } from "../../../../constants";
import { ITruckerSupplier } from "../../../../interfaces";
import { CustomAccordion } from "./CustomAccordion";

const listTruckerSupplier: ITruckerSupplier[] = [
  {
    id: 1,
    name: "Nhà cung cấp 1",
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
    name: "Nhà cung cấp 2",
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
];

export const Suppliers = () => {
  const theme = useTheme();

  const renderCardsSupplierComponent = useMemo(() => {
    return listTruckerSupplier.map((supplier) => {
      return <CustomAccordion key={supplier.id} supplier={supplier} />;
    });
  }, []);

  return (
    <Grid container rowGap={theme.spacing(16)} height={1}>
      {/* Title */}
      <Grid container>
        <TypographyStyle fontSize={theme.spacing(22)} fontWeight="bold">
          Nhà cung cấp
        </TypographyStyle>
      </Grid>

      <ListSupplierStyle item xs={12}>
        <Grid container item xs={12} rowGap={theme.spacing(12)}>
          {renderCardsSupplierComponent}
        </Grid>
      </ListSupplierStyle>
    </Grid>
  );
};

const TypographyStyle = styled(Typography)({
  color: "#FFFFFF",
});

const ListSupplierStyle = styled(Grid)(({ theme }) => ({
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
