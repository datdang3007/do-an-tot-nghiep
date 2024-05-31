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
import { ITruckerMarket, ITruckerMarketItem } from "../../../../interfaces";
import { CardMarket } from "./CardMarket";

type Props = {
  market: ITruckerMarket;
  onClickShowDetail: (info: ITruckerMarketItem) => void;
};

export const CustomAccordion = (props: Props) => {
  const theme = useTheme();
  const { market, onClickShowDetail } = props;

  const renderMarketItems = useMemo(() => {
    return market?.list?.map((item) => {
      return (
        <CardMarket
          key={item.id}
          market={item}
          onClickShowDetail={onClickShowDetail}
        />
      );
    });
  }, [market, onClickShowDetail]);

  return (
    <Accordion
      sx={{
        boxShadow: "none",
        margin: "0 !important",
        background: "transparent",
      }}
    >
      <AccordionSummaryStyle
        expandIcon={<ExpandMore sx={{ color: "#FFFFFF" }} />}
      >
        <TypographyStyle>{market.name}</TypographyStyle>
      </AccordionSummaryStyle>

      <AccordionDetails>
        <Grid
          container
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
