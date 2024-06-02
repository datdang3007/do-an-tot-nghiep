import { InfoOutlined, Navigation, Place } from "@mui/icons-material";
import { Grid, Typography, styled, useTheme } from "@mui/material";
import { ButtonCommon, ImageCommon } from "../../../../components";
import { COLOR_PALLETTE } from "../../../../constants";
import { ITruckerMarketItem } from "../../../../interfaces";
import { fetchNui } from "../../../../utils";
import { useCallback } from "react";

// --------------------------------
// --- Images:
// --------------------------------

// Store
import Store1Img from "../../../../assets/store_01.png";
import Store2Img from "../../../../assets/store_02.png";
import Store3Img from "../../../../assets/store_03.png";
import Store4Img from "../../../../assets/store_04.png";
import Store5Img from "../../../../assets/store_05.png";

// Clothes
import Clothes1Img from "../../../../assets/clothes_01.png";
import Clothes2Img from "../../../../assets/clothes_02.png";
import Clothes3Img from "../../../../assets/clothes_03.png";
import Clothes4Img from "../../../../assets/clothes_04.png";

// Machines
import Machine1Img from "../../../../assets/machine_01.png";
import Machine2Img from "../../../../assets/machine_02.png";

const objectImages: any = {
  // Stores
  store_01: Store1Img,
  store_02: Store2Img,
  store_03: Store3Img,
  store_04: Store4Img,
  store_05: Store5Img,

  // Clothes
  clothes_01: Clothes1Img,
  clothes_02: Clothes2Img,
  clothes_03: Clothes3Img,
  clothes_04: Clothes4Img,

  // Machines
  machine_01: Machine1Img,
  machine_02: Machine2Img,
};  

type Props = {
  market: ITruckerMarketItem;
  onClickShowDetail: (info: ITruckerMarketItem) => void;
};

export const CardMarket = (props: Props) => {
  const theme = useTheme();
  const { market, onClickShowDetail } = props;

  const onClickSetWaypoint = useCallback(() => {
    fetchNui("setWayPointToMarket", market);
  }, [market]);

  return (
    <CustomCard container columnGap={theme.spacing(16)}>
      {/* Image */}
      <Grid item xs="auto">
        <ImageBox>
          <ImageCommon src={objectImages[market.code]} />
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
                - Khu vực: {market.position}
              </TypographyStyle>
            </Grid>

            <Grid item xs={12}>
              <TypographyStyle fontSize={theme.spacing(13)}>
                - Tải trọng: {market.amount}
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
              {market.distance}km
            </TypographyStyle>
          </Grid>
        </Grid>

        {/* Button Actions */}
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
              onClick: onClickSetWaypoint,
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
