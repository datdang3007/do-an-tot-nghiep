import { Grid, useTheme } from "@mui/material";
import { useCallback } from "react";
import { ButtonCommon } from "../../../components";
import { ISideBar } from "../../../interfaces";
import { useTruckerJobProvider } from "../../../providers";

export const SideBar = () => {
  const theme = useTheme();
  const { tab, listSideBar, handleSetTab } = useTruckerJobProvider();

  const renderButtonsComponent = useCallback(() => {
    return listSideBar.map((item: ISideBar) => (
      <ButtonCommon
        key={item.tab}
        text={item.text}
        buttonProps={{
          fullWidth: true,
          startIcon: item.icon,
          onClick: () => handleSetTab(item.tab),
          variant: tab === item.tab ? "contained" : "outlined",
        }}
        textProps={{
          width: "100%",
          textAlign: "left",
        }}
      />
    ));
  }, [tab, listSideBar, handleSetTab]);

  return (
    <Grid container padding={theme.spacing(16)} rowGap={theme.spacing(8)}>
      {renderButtonsComponent()}
    </Grid>
  );
};
