import { Grid, Typography, styled } from "@mui/material";
import { useState } from "react";

import { SelectOption } from "./SelectOption";
import { DetailOfOption } from "./DetailOfOption";

export enum EOption {
  Safe = 1,
  Dangerous,
}

export const CTPMain = () => {
  const [detailOfOption, setDetailOfOption] = useState<EOption | null>();

  return (
    <GridContainerStyled>
      {/* Header */}
      <Grid item xs={12}>
        <Typography variant="h3" align="center" color="white">
          Chọn hướng đi cho nhân vật
        </Typography>
      </Grid>

      {detailOfOption ? (
        <Grid container marginTop="40px">
          <DetailOfOption
            option={detailOfOption}
            setDetailOfOption={setDetailOfOption}
          />
        </Grid>
      ) : (
        <Grid container marginTop="200px">
          {/* Option 01 */}
          <Grid item xs={6}>
            <SelectOption
              option={EOption.Safe}
              setDetailOfOption={setDetailOfOption}
            />
          </Grid>

          {/* Option 02 */}
          <Grid item xs={6}>
            <SelectOption
              option={EOption.Dangerous}
              setDetailOfOption={setDetailOfOption}
            />
          </Grid>
        </Grid>
      )}
    </GridContainerStyled>
  );
};

const GridContainerStyled = styled(Grid)({
  height: "100vh",
  paddingTop: "80px",
  background: "#030000",
  justifyContent: "center",
});
