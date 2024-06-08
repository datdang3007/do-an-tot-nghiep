import { Grid, Typography, styled, useTheme } from "@mui/material";
import { useEffect, useMemo, useState } from "react";
import {
  COLOR_PALLETTE,
  ESize,
  ESupplierCategories,
  ESupplierCategoriesLabel,
} from "../../../../constants";
import { ITruckerSupplier } from "../../../../interfaces";
import { CustomAccordion } from "./CustomAccordion";
import { fetchNui } from "../../../../utils";
import { randomId } from "@mui/x-data-grid-generator";

export const Suppliers = () => {
  const theme = useTheme();
  const [listTruckerSupplier, setListTruckerSupplier] = useState<
    ITruckerSupplier[]
  >([]);

  const renderCardsSupplierComponent = useMemo(() => {
    return listTruckerSupplier.map((supplier) => {
      return <CustomAccordion key={supplier.id} supplier={supplier} />;
    });
  }, [listTruckerSupplier]);

  useEffect(() => {
    const fetchData = async () => {
      const suppliersResponse = await fetchNui("getWareHouses");
      const suppliers: ITruckerSupplier[] =
        handleSuppliersResponse(suppliersResponse);
      setListTruckerSupplier(suppliers);
    };
    fetchData();
    // eslint-disable-next-line react-hooks/exhaustive-deps
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

const convertListItemSupplier = (object: any) => {
  return Object.values(ESupplierCategories).map((category) => {
    const items = Object.values(ESize).map((size) => {
      const { amount, price } = object[category][size];
      return [size, `${price} (${amount})`];
    });
    const name: string = ESupplierCategoriesLabel[category];
    return {
      id: randomId(),
      name,
      ...Object.fromEntries(items),
    };
  });
};

const handleSuppliersResponse = (suppliersResponse: any) => {
  return suppliersResponse.map((supplier: any) => {
    return {
      id: supplier.id,
      name: supplier.name,
      code: supplier.code,
      list: convertListItemSupplier(supplier),
    };
  });
};
