import { CloseRounded, Navigation } from "@mui/icons-material";
import {
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  Grid,
  Typography,
  styled,
  useTheme,
} from "@mui/material";
import { DataGrid, GridColDef } from "@mui/x-data-grid";
import { ButtonCommon } from "../../../../components";
import { COLOR_PALLETTE } from "../../../../constants";
import { useCallback } from "react";
import { fetchNui } from "../../../../utils";

type Props = {
  info: any;
  onClose: () => void;
};

export const DialogDetailPrice = (props: Props) => {
  const theme = useTheme();
  const { info, onClose } = props;

  const columns: GridColDef[] = [
    {
      field: "size",
      headerName: "Kích cỡ",
      width: 250,
      align: "center",
      sortable: false,
      resizable: false,
    },
    {
      field: "price",
      headerName: "Giá thu",
      width: 250,
      align: "center",
      sortable: false,
      resizable: false,
    },
  ];

  const onClickSetWaypoint = useCallback(() => {
    fetchNui("setWayPointToMarket", info);
  }, [info]);

  return (
    <Dialog
      open={Boolean(info)}
      PaperProps={{
        sx: {
          borderRadius: theme.spacing(8),
          background: COLOR_PALLETTE.GRAY_800,
        },
      }}
    >
      <DialogTitle>
        <Grid container>
          <TypographyStyle fontSize={theme.spacing(16)}>
            Bảng giá chi tiết: {info?.name}
          </TypographyStyle>
        </Grid>
      </DialogTitle>

      <CustomDialogContent dividers>
        <Grid container rowGap={theme.spacing(24)}>
          <Grid container rowGap={theme.spacing(8)}>
            <Grid item xs={12}>
              <TypographyStyle fontWeight="bold" fontSize={theme.spacing(14)}>
                Thông tin chung:
              </TypographyStyle>
            </Grid>

            <Grid item xs={6}>
              <TypographyStyle fontSize={theme.spacing(13)}>
                - Khu vực: {info?.position}
              </TypographyStyle>
            </Grid>

            <Grid item xs={6}>
              <TypographyStyle fontSize={theme.spacing(13)}>
                - Nhu cầu: Cao
              </TypographyStyle>
            </Grid>

            <Grid item xs={6}>
              <TypographyStyle fontSize={theme.spacing(13)}>
                - Khoảng cách: {info?.distance}km
              </TypographyStyle>
            </Grid>

            <Grid item xs={6}>
              <TypographyStyle fontSize={theme.spacing(13)}>
                - Lượng hàng: {info?.amount}/20
              </TypographyStyle>
            </Grid>
          </Grid>

          <Grid container rowGap={theme.spacing(8)}>
            <Grid item xs={12}>
              <TypographyStyle fontWeight="bold" fontSize={theme.spacing(14)}>
                Bảng giá:
              </TypographyStyle>
            </Grid>

            <CustomCard container>
              <TableStyle container>
                <DataGrid
                  columns={columns}
                  rows={info?.detailPrice ?? []}
                  hideFooter
                  disableColumnMenu
                  disableColumnFilter
                  disableColumnSelector
                />
              </TableStyle>
            </CustomCard>
          </Grid>
        </Grid>
      </CustomDialogContent>

      {/* Button Acctions */}
      <DialogActions>
        <Grid
          container
          alignItems="flex-end"
          justifyContent="flex-end"
          columnGap={theme.spacing(12)}
        >
          <ButtonCommon
            text="Đóng"
            buttonProps={{
              color: "primary",
              variant: "outlined",
              startIcon: <CloseRounded />,
              onClick: onClose,
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
      </DialogActions>
    </Dialog>
  );
};

const TypographyStyle = styled(Typography)({
  color: "#FFFFFF",
});

const CustomDialogContent = styled(DialogContent)({
  borderColor: COLOR_PALLETTE.GRAY_700,
});

const CustomCard = styled(Grid)(({ theme }) => ({
  borderRadius: theme.spacing(4),
  background: COLOR_PALLETTE.GRAY_800,
}));

const TableStyle = styled(Grid)({
  ".MuiDataGrid-columnHeader": {
    color: "#FFFFFF",
  },
  ".MuiDataGrid-cellContent": {
    color: "#FFFFFF",
  },
  ".MuiDataGrid-columnSeparator": {
    display: "none !important",
  },
  ".MuiDataGrid-row": {
    backgroundColor: "transparent !important",
  },
  ".MuiDataGrid-columnHeaderTitleContainer": {
    justifyContent: "center",
  },
  ".MuiDataGrid-cell": {
    outline: "none !important",
    justifyContent: "center",
  },
});
