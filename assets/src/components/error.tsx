

type Error = { message?: string; jimNotified?: boolean };

export const Error = ({ message, jimNotified = true }: Error) => {
  return (
    <div className="flex flex-col">
      <div className="flex flex-row items-center">
        <label className="text-2xl font-bold text-red-700">Error</label>
      </div>
      {jimNotified ? (
        <>
          <label className="font-bold my-4">
            Jim has been notified of this error. Please try again in a few
            minutes.
          </label>

          <label className="font-bold">Details:</label>
        </>
      ) : null}
      <div>

      <label>{errorMessage(message)}</label>
      </div>
    </div>
  );
};

const errorMessage = (message = "Something went wrong.") => message;
