import { Box, Container, Grid, Typography, styled } from "@mui/material";
import { useCallback, useMemo } from "react";
import ImageOptionSafe from "../../assets/option_01.jpg";
import ImageOptionDangerous from "../../assets/option_02.jpg";
import { ButtonCommon, ImageCommon } from "../../components";
import { EOption } from "./CTPMain";
import DetailOfOptionSafe from "../../jsons/DetailOfOptionSafe.json";
import DetailOfOptionDangerous from "../../jsons/DetailOfOptionDangerous.json";
import { fetchNui } from "../../utils/fetchNui";

type Props = {
  option: EOption;
  setDetailOfOption: any;
};

export const DetailOfOption = (props: Props) => {
  const { option, setDetailOfOption } = props;

  const detailObject = useMemo(() => {
    switch (option) {
      case EOption.Safe: {
        return {
          image: ImageOptionSafe,
          optionName: "An toàn",
          difficult: "6/10",
          safe: "9/10",
          btnAcceptColor: "primary",
          information: DetailOfOptionSafe,
        };
      }
      case EOption.Dangerous: {
        return {
          image: ImageOptionDangerous,
          optionName: "Mạo hiểm",
          difficult: "9/10",
          safe: "6/10",
          btnAcceptColor: "error",
          information: DetailOfOptionDangerous,
        };
      }
    }
  }, [option]);

  const InformationComponent = useMemo(() => {
    return detailObject.information.map((i) => (
      <Grid container rowGap="8px">
        {/* Title */}
        {i?.title && (
          <Grid item xs={12}>
            <Typography fontWeight="bold" color="white">
              {i?.title}
            </Typography>
          </Grid>
        )}

        {/* Content */}
        <Grid item xs={12}>
          <Typography color="white">{i.content}</Typography>
        </Grid>
      </Grid>
    ));
  }, [detailObject]);

  const onClickButtonBack = useCallback(() => {
    setDetailOfOption(null);
  }, [setDetailOfOption]);

  const onClickButtonAccept = useCallback(() => {
    fetchNui("finalChoseThePath", { option: option }).then(() => {
      setTimeout(() => {
        setDetailOfOption(null);
      }, 250);
    });
  }, [option, setDetailOfOption]);

  return (
    <Grid container>
      <ContainerStyle maxWidth="xl">
        <Grid container rowGap="40px">
          {/* Row 01 */}
          <Grid container columnGap="36px" height="250px">
            <Grid item xs={2}>
              <ImageStyle>
                <ImageCommon src={detailObject.image} />
              </ImageStyle>
            </Grid>

            <Grid container item xs alignItems="flex-end">
              <Grid container height="60%" alignItems="flex-end">
                <Grid item xs={12}>
                  <Typography color="white">
                    Lựa chọn: {detailObject.optionName}
                  </Typography>
                </Grid>

                <Grid item xs={12}>
                  <Typography color="white">
                    Độ khó: {detailObject.difficult}
                  </Typography>
                </Grid>

                <Grid item xs={12}>
                  <Typography color="white">
                    Mức độ an toàn: {detailObject.safe}
                  </Typography>
                </Grid>
              </Grid>
            </Grid>
          </Grid>

          <Grid container rowGap="24px">
            {InformationComponent}
          </Grid>

          {/* Button Actions */}
          <Grid container columnGap={"12px"}>
            <ButtonCommon
              text="Trở lại"
              buttonProps={{
                color: "inherit",
                onClick: onClickButtonBack,
              }}
            />
            <ButtonCommon
              text="Xác nhận"
              buttonProps={{
                color: detailObject.btnAcceptColor,
                onClick: onClickButtonAccept,
              }}
            />
          </Grid>
        </Grid>
      </ContainerStyle>
    </Grid>
  );
};

const ContainerStyle = styled(Container)({
  padding: "20px",
  background: "rgba(96, 96, 96, 1)",
});

const ImageStyle = styled(Box)({
  width: "100%",
  height: "100%",
  border: "3px solid rgb(0,0,0)",
});
