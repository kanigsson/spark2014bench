;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort int_type 0)

(declare-fun int_typeqtint (int_type) Int)

;; int_type'axiom
  (assert
  (forall ((i int_type))
  (and (<= (- 100) (int_typeqtint i)) (<= (int_typeqtint i) 100))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 100) x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (int_type int_type) Bool)

(declare-const dummy int_type)

(declare-datatypes ((int_type__ref 0))
(((int_type__refqtmk (int_type__content int_type)))))
(define-fun int_type__ref_int_type__content__projection ((a int_type__ref)) int_type 
  (int_type__content a))

(define-fun to_rep ((x int_type)) Int (int_typeqtint x))

(declare-fun of_rep (Int) int_type)

;; inversion_axiom
  (assert
  (forall ((x int_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x int_type)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__main__my_complex_pkg__complex_type__real int_type)(rec__main__my_complex_pkg__complex_type__imag int_type)))))
(define-fun us_split_fields_rec__main__my_complex_pkg__complex_type__real__projection ((a us_split_fields)) int_type 
  (rec__main__my_complex_pkg__complex_type__real a))

(define-fun us_split_fields_rec__main__my_complex_pkg__complex_type__imag__projection ((a us_split_fields)) int_type 
  (rec__main__my_complex_pkg__complex_type__imag a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__main__my_complex_pkg__complex_type__real
                           (us_split_fields1 a))) (to_rep
                                                  (rec__main__my_complex_pkg__complex_type__real
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__main__my_complex_pkg__complex_type__imag
                           (us_split_fields1 a))) (to_rep
                                                  (rec__main__my_complex_pkg__complex_type__imag
                                                  (us_split_fields1 b)))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const main__my_complex_pkg__complex_type__real__first__bit Int)

(declare-const main__my_complex_pkg__complex_type__real__last__bit Int)

(declare-const main__my_complex_pkg__complex_type__real__position Int)

;; main__my_complex_pkg__complex_type__real__first__bit_axiom
  (assert (<= 0 main__my_complex_pkg__complex_type__real__first__bit))

;; main__my_complex_pkg__complex_type__real__last__bit_axiom
  (assert
  (< main__my_complex_pkg__complex_type__real__first__bit main__my_complex_pkg__complex_type__real__last__bit))

;; main__my_complex_pkg__complex_type__real__position_axiom
  (assert (<= 0 main__my_complex_pkg__complex_type__real__position))

(declare-const main__my_complex_pkg__complex_type__imag__first__bit Int)

(declare-const main__my_complex_pkg__complex_type__imag__last__bit Int)

(declare-const main__my_complex_pkg__complex_type__imag__position Int)

;; main__my_complex_pkg__complex_type__imag__first__bit_axiom
  (assert (<= 0 main__my_complex_pkg__complex_type__imag__first__bit))

;; main__my_complex_pkg__complex_type__imag__last__bit_axiom
  (assert
  (< main__my_complex_pkg__complex_type__imag__first__bit main__my_complex_pkg__complex_type__imag__last__bit))

;; main__my_complex_pkg__complex_type__imag__position_axiom
  (assert (<= 0 main__my_complex_pkg__complex_type__imag__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((complex_type__ref 0))
(((complex_type__refqtmk (complex_type__content us_rep)))))
(define-fun complex_type__ref_complex_type__content__projection ((a complex_type__ref)) us_rep 
  (complex_type__content a))

(declare-const zero us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const factor Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const c us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun oadd (us_rep us_rep) us_rep)

(declare-fun oadd__function_guard (us_rep us_rep us_rep) Bool)

;; oadd__post_axiom
  (assert true)

(declare-fun osubtract (us_rep) us_rep)

(declare-fun osubtract__function_guard (us_rep us_rep) Bool)

;; osubtract__post_axiom
  (assert true)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort tmy_integerB 0)

(declare-fun tmy_integerBqtint (tmy_integerB) Int)

;; tmy_integerB'axiom
  (assert
  (forall ((i tmy_integerB))
  (and (<= (- 128) (tmy_integerBqtint i)) (<= (tmy_integerBqtint i) 127))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 128) x) (<= x 127)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (tmy_integerB tmy_integerB) Bool)

(declare-const dummy2 tmy_integerB)

(declare-datatypes ((tmy_integerB__ref 0))
(((tmy_integerB__refqtmk (tmy_integerB__content tmy_integerB)))))
(define-fun tmy_integerB__ref_tmy_integerB__content__projection ((a tmy_integerB__ref)) tmy_integerB 
  (tmy_integerB__content a))

(define-fun dynamic_invariant ((temp___expr_192 Int)
  (temp___is_init_188 Bool) (temp___skip_constant_189 Bool)
  (temp___do_toplevel_190 Bool)
  (temp___do_typ_inv_191 Bool)) Bool (=>
                                     (or (= temp___is_init_188 true)
                                     (<= (- 100) 100)) (in_range1
                                     temp___expr_192)))

(declare-const rliteral int_type)

;; rliteral_axiom
  (assert (= (int_typeqtint rliteral) 0))

;; zero__def_axiom
  (assert (= zero (us_repqtmk (us_split_fieldsqtmk rliteral rliteral))))

(assert
;; defqtvc
 ;; File "parent.ads", line 74, characters 0-0
  (not
  (forall ((result____split_fields us_split_fields))
  (=> (= (us_repqtmk (us_split_fieldsqtmk rliteral rliteral)) zero)
  (=> (dynamic_invariant factor true false true true)
  (=> (= result____split_fields (us_split_fields1 zero)) (in_range2
  (abs1 factor))))))))
(check-sat)