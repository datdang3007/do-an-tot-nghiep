import { Button, Typography, TypographyProps } from "@mui/material";

type Props = {
  text: string;
  buttonProps?: any;
  textProps?: TypographyProps;
};

export const ButtonCommon = (props: Props) => {
  const { text, textProps, buttonProps } = props;

  return (
    <Button variant="contained" color="primary" {...buttonProps}>
      <Typography fontSize={"14px"} textTransform={"none"} {...textProps}>
        {text}
      </Typography>
    </Button>
  );
};
