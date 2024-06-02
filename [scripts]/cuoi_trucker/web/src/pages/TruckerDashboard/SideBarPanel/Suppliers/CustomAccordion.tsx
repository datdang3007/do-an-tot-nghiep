import { ExpandMore, Place } from "@mui/icons-material";
import {
  Accordion,
  AccordionDetails,
  AccordionSummary,
  Grid,
  IconButton,
  Tooltip,
  Typography,
  styled,
  useTheme,
} from "@mui/material";
import { COLOR_PALLETTE } from "../../../../constants";
import { ITruckerSupplier } from "../../../../interfaces";
import { CardSupplier } from "./CardSupplier";
import { useCallback } from "react";
import { fetchNui } from "../../../../utils";

type Props = {
  supplier: ITruckerSupplier;
};

export const CustomAccordion = (props: Props) => {
  const theme = useTheme();
  const { supplier } = props;

  const onClickSetWaypoint = useCallback(() => {
    fetchNui("setWayPointToSupplier", supplier);
  }, [supplier]);

  return (
    <Accordion
      sx={{
        width: "100%",
        boxShadow: "none",
        margin: "0 !important",
        background: "transparent",
      }}
    >
      <AccordionSummaryStyle
        expandIcon={<ExpandMore sx={{ color: "#FFFFFF" }} />}
      >
        <Grid container alignItems="center" columnGap={theme.spacing(8)}>
          {/* Button GPS */}
          <Tooltip title="Chỉ đường" enterDelay={350}>
            <IconButton color="primary" onClick={onClickSetWaypoint}>
              <Place sx={{ fontSize: theme.spacing(14) }} />
            </IconButton>
          </Tooltip>
          <TypographyStyle>{supplier.name}</TypographyStyle>
        </Grid>
      </AccordionSummaryStyle>

      <AccordionDetails>
        <Grid
          container
          item
          xs={12}
          rowGap={theme.spacing(12)}
          paddingTop={theme.spacing(16)}
        >
          <CardSupplier
            key={supplier.id}
            data={supplier.list}
            onClickSetWaypoint={onClickSetWaypoint}
          />
        </Grid>
      </AccordionDetails>
    </Accordion>
  );
};

const TypographyStyle = styled(Typography)({
  color: "#FFFFFF",
});

const AccordionSummaryStyle = styled(AccordionSummary)(({ theme }) => ({
  borderRadius: theme.spacing(8),
  background: COLOR_PALLETTE.GRAY_800,
  border: `1px solid ${COLOR_PALLETTE.GRAY_700}`,
}));
