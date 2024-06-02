import { Grid, Typography, useTheme } from "@mui/material";
import { useMemo } from "react";
import { ETruckerTabId } from "../../../constants";
import { useTruckerJobProvider } from "../../../providers";
import { Markets } from "./Markets";
import { Suppliers } from "./Suppliers";
import { Vehicles } from "./Vehicles";

export const SideBarPanel = () => {
  const theme = useTheme();
  const { tab } = useTruckerJobProvider();

  const tabPanelComponent = useMemo(() => {
    switch (tab) {
      case ETruckerTabId.Vehicles:
        return <Vehicles />;
      case ETruckerTabId.Markets:
        return <Markets />;
      case ETruckerTabId.Suppliers:
        return <Suppliers />;
      default:
        return <Typography>unknown</Typography>;
    }
  }, [tab]);

  return (
    <Grid container height={1} padding={theme.spacing(16)}>
      {tabPanelComponent}
    </Grid>
  );
};
