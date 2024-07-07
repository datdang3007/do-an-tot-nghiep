import { Container, Grid, Typography, styled } from "@mui/material";
import { useCallback, useMemo } from "react";
import { ButtonCommon, ImageCommon } from "../../components";
import StoreRobberyImg from "../../assets/store_robbery.jpeg";
import MoneyLaunderingImg from "../../assets/money_laundering.webp";
import AssassinImg from "../../assets/assasin_sniper.webp";
import WeedPlanImg from "../../assets/weed_plan.jpg";
import WeedManufacturingImg from "../../assets/manufacturing_weed.webp";
import WeedExpressImg from "../../assets/weed_express.jpg";
import WeedTruckingImg from "../../assets/weed_trucking.jpeg";
import RandolHeistImg from "../../assets/randol_heist.jpg";
import { fetchNui } from "../../utils/fetchNui";

const options = [
  {
    name: "Cướp tạp hóa",
    image: StoreRobberyImg,
    mission: "store_robbery",
  },
  {
    name: "Rửa tiền",
    image: MoneyLaunderingImg,
    mission: "money_laundering",
  },
  {
    name: "Ám sát",
    image: AssassinImg,
    mission: "assassin",
  },
  {
    name: "Hái cần sa",
    image: WeedPlanImg,
    mission: "weed_plan",
  },
  {
    name: "Chế tác cần sa",
    image: WeedManufacturingImg,
    mission: "weed_manufacturing",
  },
  {
    name: "Giao hàng cấm",
    image: WeedExpressImg,
    mission: "weed_express",
  },
  {
    name: "Vận chuyển hàng cấm",
    image: WeedTruckingImg,
    mission: "weed_trucking",
  },
  {
    name: "Cướp tàu ngầm",
    image: RandolHeistImg,
    mission: "randol_heist",
  },
];

export const MafiaMissionsMain = () => {
  const onSelectMission = useCallback((mission: string) => {
    fetchNui("selectMission", { mission });
  }, []);

  const optionComponent = useMemo(
    () =>
      options.map((op) => {
        return (
          <Grid item xs={4} padding="8px">
            <CardStyle container item xs={12} rowGap="8px">
              {/* Image */}
              <Grid item xs={12} height="220px">
                <ImageCommon src={op.image ?? ""} />
              </Grid>

              {/* Name */}
              <Grid item xs={12}>
                <Typography fontWeight="bold">{op.name}</Typography>
              </Grid>

              {/* Button Actions */}
              <Grid
                container
                item
                xs={12}
                columnGap="8px"
                justifyContent="flex-end"
              >
                <ButtonCommon text="Chi tiết" />
                <ButtonCommon
                  text="Nhận nhiệm vụ"
                  buttonProps={{
                    color: "success",
                    onClick: () => onSelectMission(op.mission),
                  }}
                />
              </Grid>
            </CardStyle>
          </Grid>
        );
      }),
    []
  );

  return (
    <Grid container height="100vh" alignItems="center" justifyContent="center">
      <ContainerStyle maxWidth="lg">
        <CardListStyle container>{optionComponent}</CardListStyle>
      </ContainerStyle>
    </Grid>
  );
};

const ContainerStyle = styled(Container)({
  height: "80vh",
  padding: "12px !important",
  background: "#030000",
});

const CardListStyle = styled(Grid)({
  height: "100%",
  overflow: "auto",

  "&::-webkit-scrollbar-track": {
    backgroundColor: "#F5F5F5",
    boxShadow: ` 0 0 6px rgba(0,0,0,0.3) inset`,
  },

  "&::-webkit-scrollbar": {
    width: "6px",
    backgroundColor: "#F5F5F5",
  },

  "&::-webkit-scrollbar-thumb": {
    backgroundColor: "#1565c0",
  },
});

const CardStyle = styled(Grid)({
  padding: "8px",
  background: "#FFF",
});
