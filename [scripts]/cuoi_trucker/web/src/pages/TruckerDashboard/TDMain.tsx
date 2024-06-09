import { Card, Container, Divider, Grid, styled } from "@mui/material";
import { COLOR_PALLETTE } from "../../constants";
import { TruckerJobProvider } from "../../providers";
import { SideBar } from "./SideBar";
import { SideBarPanel } from "./SideBarPanel";

type Props = {
  pageCode: string;
};

export const TDMain = (props: Props) => {
  const { pageCode } = props;

  return (
    <TruckerJobProvider pageCode={pageCode}>
      <ContainerStyle maxWidth="lg">
        <CardStyle>
          <Grid container height={1}>
            {/* Sidebar */}
            <Grid item xs={2.5} height={1}>
              <SideBar />
            </Grid>

            <Divider
              orientation="vertical"
              flexItem
              sx={{ background: COLOR_PALLETTE.GRAY_700 }}
            />

            {/* Sidebar Panel */}
            <Grid item xs height={1}>
              <SideBarPanel />
            </Grid>
          </Grid>
        </CardStyle>
      </ContainerStyle>
    </TruckerJobProvider>
  );
};

const ContainerStyle = styled(Container)({
  position: "absolute",
  top: "50%",
  left: "50%",
  transform: "translate(-50%, -50%)",
});

const CardStyle = styled(Card)({
  borderRadius: "16px",
  height: "calc(100vh - 260px)",
  background: COLOR_PALLETTE.BLACK,
  border: `2px solid ${COLOR_PALLETTE.GRAY_700}`,
});
