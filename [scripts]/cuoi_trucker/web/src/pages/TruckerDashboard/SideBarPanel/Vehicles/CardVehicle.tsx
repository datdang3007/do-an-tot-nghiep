import { AttachMoney, CarRental } from "@mui/icons-material";
import { Grid, Typography, styled, useTheme } from "@mui/material";
import { useCallback } from "react";
import { ButtonCommon, ImageCommon } from "../../../../components";
import { COLOR_PALLETTE } from "../../../../constants";
import { ITruckerVehicle } from "../../../../interfaces";
import { fetchNui, formatCurrency } from "../../../../utils";

type Props = {
  vehicle: ITruckerVehicle;
};

export const CardVehicle = (props: Props) => {
  const theme = useTheme();
  const { vehicle } = props;

  const onClickButtonRent = useCallback(() => {
    fetchNui("rentVehicle", vehicle);
  }, [vehicle]);

  return (
    <CustomCard container columnGap={theme.spacing(16)}>
      {/* Image */}
      <Grid item xs="auto">
        <ImageBox>
          <ImageCommon src={vehicle.image} />
        </ImageBox>
      </Grid>

      {/* Info */}
      <Grid item xs>
        <Grid container height={1} flexDirection="row">
          <Grid item xs="auto">
            {/* Name */}
            <Grid item xs={12}>
              <TypographyStyle fontSize={theme.spacing(18)} fontWeight="bold">
                {vehicle.name}
              </TypographyStyle>
            </Grid>

            {/* Level */}
            <Grid item xs={12}>
              <TypographyStyle fontSize={theme.spacing(11)}>
                Cấp độ {vehicle.level}
              </TypographyStyle>
            </Grid>
          </Grid>

          <Grid container rowGap={theme.spacing(4)}>
            <Grid item xs={12}>
              <TypographyStyle fontSize={theme.spacing(13)}>
                - Tốc độ: {vehicle.speed} km/h
              </TypographyStyle>
            </Grid>

            <Grid item xs={12}>
              <TypographyStyle fontSize={theme.spacing(13)}>
                - Khoảng trống cốp: {vehicle.trunkSpace}
              </TypographyStyle>
            </Grid>

            <Grid item xs={12}>
              <TypographyStyle fontSize={theme.spacing(13)}>
                - Mặt hàng có thể chở: {vehicle.listCargo.join(", ")}
              </TypographyStyle>
            </Grid>
          </Grid>
        </Grid>
      </Grid>

      {/* Button Acctions */}
      <Grid container item xs="auto" alignItems="flex-end">
        <Grid container columnGap={theme.spacing(12)}>
          <Grid
            container
            item
            xs="auto"
            flexDirection="column"
            rowGap={theme.spacing(4)}
          >
            <TypographyStyle textAlign="center">{`$${formatCurrency(
              vehicle.rent
            )}`}</TypographyStyle>
            <ButtonCommon
              text="Thuê"
              buttonProps={{
                color: "primary",
                variant: "outlined",
                startIcon: <CarRental />,
                onClick: onClickButtonRent,
                sx: { width: theme.spacing(110) },
              }}
            />
          </Grid>

          <Grid
            container
            item
            xs="auto"
            flexDirection="column"
            rowGap={theme.spacing(4)}
          >
            <TypographyStyle textAlign="center">{`$${formatCurrency(
              vehicle.price
            )}`}</TypographyStyle>
            <ButtonCommon
              text="Mua"
              buttonProps={{
                color: "primary",
                variant: "contained",
                startIcon: <AttachMoney />,
                sx: { width: theme.spacing(110) },
              }}
            />
          </Grid>
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
