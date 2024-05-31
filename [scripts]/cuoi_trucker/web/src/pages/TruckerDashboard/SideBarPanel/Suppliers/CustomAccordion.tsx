import { ExpandMore } from "@mui/icons-material";
import {
  Accordion,
  AccordionDetails,
  AccordionSummary,
  Grid,
  Typography,
  styled,
  useTheme,
} from "@mui/material";
import { useMemo } from "react";
import { COLOR_PALLETTE } from "../../../../constants";
import { ITruckerSupplier } from "../../../../interfaces";
import { CardSupplier } from "./CardSupplier";

type Props = {
  supplier: ITruckerSupplier;
};

export const CustomAccordion = (props: Props) => {
  const theme = useTheme();
  const { supplier } = props;

  const renderMarketItems = useMemo(() => {
    return supplier?.list?.map((item) => {
      return <CardSupplier key={item.id} />;
    });
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
        <TypographyStyle>{supplier.name}</TypographyStyle>
      </AccordionSummaryStyle>

      <AccordionDetails>
        <Grid
          container
          item
          xs={12}
          rowGap={theme.spacing(12)}
          paddingTop={theme.spacing(16)}
        >
          {renderMarketItems}
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
