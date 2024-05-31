import { Container, Grid, Typography, styled } from "@mui/material";
import { useCallback, useMemo } from "react";
import { ButtonCommon, ImageCommon } from "../../components";
import TaxiJobBanner from "../../assets/taxi_job.png";
import PizzaJobBanner from "../../assets/pizza_job.jpg";
import LumberJackJobBanner from "../../assets/lumber_jack_job.jpg";
import RecycleJobBanner from "../../assets/recycle_job.png";
import MinerJobBanner from "../../assets/miner_job.jpeg";
import SanitationJobBanner from "../../assets/sanitation_job.jpeg";
import TruckerJobBanner from "../../assets/trucker_job.jpg";
import { fetchNui } from "../../utils/fetchNui";

const options = [
  { name: "Tài xế taxi", job: "taxi", image: TaxiJobBanner },
  { name: "Nhân viên giao pizza", job: "pizza", image: PizzaJobBanner },
  { name: "Thợ mộc", job: "lumberjack", image: LumberJackJobBanner },
  { name: "Bốc hàng", job: "recycle", image: RecycleJobBanner },
  { name: "Thợ mỏ", job: "miner", image: MinerJobBanner },
  {
    name: "Nhân viên môi trường",
    job: "sanitation",
    image: SanitationJobBanner,
  },
  { name: "Nhân viên vận chuyển", job: "trucker", image: TruckerJobBanner },
];

export const MenuJobMain = () => {
  const onClickButtonSelectJob = useCallback((job) => {
    fetchNui("selectJob", { job });
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
                  text="Nhận nghề"
                  buttonProps={{
                    color: "success",
                    onClick: () => onClickButtonSelectJob(op.job),
                  }}
                />
              </Grid>
            </CardStyle>
          </Grid>
        );
      }),
    [onClickButtonSelectJob]
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
