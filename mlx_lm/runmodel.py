from mlx_lm import load, generate
import argparse

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="inference script")
    parser.add_argument(
        "--model",
        type=str,
        default="mlx_model",
        help="The path to the local model directory or Hugging Face repo.",
    )
    parser.add_argument(
        "--prompt",
        help="The message to be processed by the model",
        default="Write a detailed analogy between mathematics and a lighthouse.",
    )
    parser.add_argument(
        "--max-tokens",
        "-m",
        type=int,
        default=100,
        help="Maximum number of tokens to generate",
    )
    parser.add_argument(
        "--temp",
        help="The sampling temperature.",
        type=float,
        default=0.0,
    )
    parser.add_argument("--seed", type=int, default=0, help="The PRNG seed")

    args = parser.parse_args()
    model, tokenizer = load("microsoft/phi-2")
    generate(model, tokenizer, prompt=args.prompt, verbose=True, max_tokens=args.max_tokens)
