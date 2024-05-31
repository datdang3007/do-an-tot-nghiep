import { InfoOutlined, Navigation, Place } from "@mui/icons-material";
import { Grid, Typography, styled, useTheme } from "@mui/material";
import { ButtonCommon, ImageCommon } from "../../../../components";
import { COLOR_PALLETTE } from "../../../../constants";
import { ITruckerMarketItem } from "../../../../interfaces";

type Props = {
  market: ITruckerMarketItem;
  onClickShowDetail: (info: ITruckerMarketItem) => void;
};

export const CardMarket = (props: Props) => {
  const theme = useTheme();
  const { market, onClickShowDetail } = props;

  return (
    <CustomCard container columnGap={theme.spacing(16)}>
      {/* Image */}
      <Grid item xs="auto">
        <ImageBox>
          <ImageCommon src={market.image} />
        </ImageBox>
      </Grid>

      {/* Info */}
      <Grid item xs>
        <Grid container height={1} flexDirection="row">
          <Grid item xs="auto">
            {/* Name */}
            <Grid item xs={12}>
              <TypographyStyle fontSize={theme.spacing(18)} fontWeight="bold">
                {market.name}
              </TypographyStyle>
            </Grid>

            {/* Sub Title */}
            <Grid item xs={12}>
              <TypographyStyle fontSize={theme.spacing(11)}>
                {market.subTitle}
              </TypographyStyle>
            </Grid>
          </Grid>

          <Grid container rowGap={theme.spacing(4)}>
            <Grid item xs={12}>
              <TypographyStyle fontSize={theme.spacing(13)}>
                - Khu vực: Thành phố
              </TypographyStyle>
            </Grid>

            <Grid item xs={12}>
              <TypographyStyle fontSize={theme.spacing(13)}>
                - Tải trọng: 7/20
              </TypographyStyle>
            </Grid>

            <Grid item xs={12}>
              <TypographyStyle fontSize={theme.spacing(13)}>
                - Nhu cầu: Cao
              </TypographyStyle>
            </Grid>
          </Grid>
        </Grid>
      </Grid>

      <Grid container item xs="auto" justifyContent="flex-end">
        {/* Distance */}
        <Grid item xs="auto">
          <Grid container alignItems="center" columnGap={theme.spacing(2)}>
            <Place
              sx={{ color: COLOR_PALLETTE.MAIN, fontSize: theme.spacing(13) }}
            />
            <TypographyStyle fontSize={theme.spacing(13)}>
              {parseFloat(market.distance).toFixed(2)}km
            </TypographyStyle>
          </Grid>
        </Grid>

        {/* Button Acctions */}
        <Grid
          container
          alignItems="flex-end"
          justifyContent="flex-end"
          columnGap={theme.spacing(12)}
        >
          <ButtonCommon
            text="Bảng giá chi tiết"
            buttonProps={{
              color: "primary",
              variant: "outlined",
              startIcon: <InfoOutlined />,
              onClick: () => onClickShowDetail(market),
            }}
          />
          <ButtonCommon
            text="Chỉ đường"
            buttonProps={{
              color: "primary",
              variant: "contained",
              startIcon: <Navigation />,
            }}
          />
        </Grid>
      </Grid>
    </CustomCard>
  );
};

const TypographyStyle = styled(Typography)({
  color: "#FFFFFF",
});

const ImageBox = styled(Grid)(({ theme }) => ({
  overflow: "hidden",
  width: theme.spacing(260),
  borderRadius: theme.spacing(4),
}));

const CustomCard = styled(Grid)(({ theme }) => ({
  padding: theme.spacing(12),
  borderRadius: theme.spacing(8),
  background: COLOR_PALLETTE.GRAY_800,
}));
