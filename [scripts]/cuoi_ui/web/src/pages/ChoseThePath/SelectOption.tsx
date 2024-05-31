import { Box, Grid, Typography, styled } from "@mui/material";
import { useCallback, useMemo } from "react";
import ImageOptionSafe from "../../assets/option_01.jpg";
import ImageOptionDangerous from "../../assets/option_02.jpg";
import { ImageCommon } from "../../components";
import { EOption } from "./CTPMain";

type Props = {
  option: EOption;
  setDetailOfOption: any;
};

export const SelectOption = (props: Props) => {
  const { option, setDetailOfOption } = props;

  const optionObject = useMemo(() => {
    switch (option) {
      case EOption.Safe: {
        return {
          text: "An toàn",
          textBg: "blue",
          image: ImageOptionSafe,
        };
      }
      case EOption.Dangerous: {
        return {
          text: "Mạo hiểm",
          textBg: "red",
          image: ImageOptionDangerous,
        };
      }
    }
  }, [option]);

  const onClick = useCallback(() => {
    setDetailOfOption(option);
  }, [option, setDetailOfOption]);

  return (
    <>
      {/* Image */}
      <Grid container justifyContent={"center"}>
        <Grid item xs={8} onClick={onClick}>
          <Grid container justifyContent="center">
            <Grid position="relative" height="500px">
              <ImageEffectStyle />
              <ImageCommon src={optionObject.image} />
            </Grid>
          </Grid>

          <Grid
            container
            justifyContent="center"
            sx={{ background: optionObject.textBg }}
          >
            <GridText item>
              <Typography color="white">{optionObject.text}</Typography>
            </GridText>
          </Grid>
        </Grid>
      </Grid>
    </>
  );
};

const GridText = styled(Grid)({
  padding: "12px",
});

const ImageEffectStyle = styled(Box)({
  position: "absolute",
  cursor: "pointer",
  width: "100%",
  height: "100%",
  transition: "0.4s",
  boxShadow: "0 0 1000px 5px rgba(0,0,0, 180) inset",
  "&:hover": {
    boxShadow: "unset",
  },
});
