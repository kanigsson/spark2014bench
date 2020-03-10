(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__member_alt__my_rec__d Bool)))))
(define-fun us_split_discrs_rec__member_alt__my_rec__d__projection ((a us_split_discrs)) Bool 
  (rec__member_alt__my_rec__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__member_alt__my_rec__f integer)))))
(define-fun us_split_fields_rec__member_alt__my_rec__f__projection ((a us_split_fields)) integer 
  (rec__member_alt__my_rec__f a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__member_alt__my_rec__d
                                (us_split_discrs1 a)) 1 0) (ite (rec__member_alt__my_rec__d
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (= (to_rep
                           (rec__member_alt__my_rec__f (us_split_fields1 a))) 
                        (to_rep
                        (rec__member_alt__my_rec__f (us_split_fields1 b)))))
                   true false))

(define-fun in_range2 ((rec__member_alt__my_rec__d1 Bool)
  (a us_split_discrs)) Bool (= rec__member_alt__my_rec__d1 (rec__member_alt__my_rec__d
                                                           a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const member_alt__my_rec__d__first__bit Int)

(declare-const member_alt__my_rec__d__last__bit Int)

(declare-const member_alt__my_rec__d__position Int)

;; member_alt__my_rec__d__first__bit_axiom
  (assert (<= 0 member_alt__my_rec__d__first__bit))

;; member_alt__my_rec__d__last__bit_axiom
  (assert
  (< member_alt__my_rec__d__first__bit member_alt__my_rec__d__last__bit))

;; member_alt__my_rec__d__position_axiom
  (assert (<= 0 member_alt__my_rec__d__position))

(declare-const member_alt__my_rec__f__first__bit Int)

(declare-const member_alt__my_rec__f__last__bit Int)

(declare-const member_alt__my_rec__f__position Int)

;; member_alt__my_rec__f__first__bit_axiom
  (assert (<= 0 member_alt__my_rec__f__first__bit))

;; member_alt__my_rec__f__last__bit_axiom
  (assert
  (< member_alt__my_rec__f__first__bit member_alt__my_rec__f__last__bit))

;; member_alt__my_rec__f__position_axiom
  (assert (<= 0 member_alt__my_rec__f__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((my_rec__ref 0))
(((my_rec__refqtmk (my_rec__content us_rep)))))
(define-fun my_rec__ref_my_rec__content__projection ((a my_rec__ref)) us_rep 
  (my_rec__content a))

(declare-fun oeq (us_rep us_rep) Bool)

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (and
     (forall ((a1 us_rep) (b1 us_rep)) (oeq__function_guard (oeq a1 b1) a1
     b1)) (= (user_eq1 a b) (oeq a b))) :pattern ((user_eq1 a b)) )))

(declare-const x__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun f (Int) us_rep)

(declare-fun f__function_guard (us_rep Int) Bool)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const member_alt__my_rec__d__first__bit1 Int)

(declare-const member_alt__my_rec__d__last__bit1 Int)

(declare-const member_alt__my_rec__d__position1 Int)

;; member_alt__my_rec__d__first__bit_axiom
  (assert (<= 0 member_alt__my_rec__d__first__bit1))

;; member_alt__my_rec__d__last__bit_axiom
  (assert
  (< member_alt__my_rec__d__first__bit1 member_alt__my_rec__d__last__bit1))

;; member_alt__my_rec__d__position_axiom
  (assert (<= 0 member_alt__my_rec__d__position1))

(declare-const member_alt__my_rec__f__first__bit1 Int)

(declare-const member_alt__my_rec__f__last__bit1 Int)

(declare-const member_alt__my_rec__f__position1 Int)

;; member_alt__my_rec__f__first__bit_axiom
  (assert (<= 0 member_alt__my_rec__f__first__bit1))

;; member_alt__my_rec__f__last__bit_axiom
  (assert
  (< member_alt__my_rec__f__first__bit1 member_alt__my_rec__f__last__bit1))

;; member_alt__my_rec__f__position_axiom
  (assert (<= 0 member_alt__my_rec__f__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((t16b__ref 0))
(((t16b__refqtmk (t16b__content us_rep)))))
(define-fun t16b__ref_t16b__content__projection ((a t16b__ref)) us_rep 
  (t16b__content a))

;; f__post_axiom
  (assert true)

;; f__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (= (f x) (us_repqtmk (us_split_discrsqtmk (distinct 1 0))
              (us_split_fieldsqtmk (of_rep x))))) :pattern ((f x)) )))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const member_alt__my_rec__d__first__bit2 Int)

(declare-const member_alt__my_rec__d__last__bit2 Int)

(declare-const member_alt__my_rec__d__position2 Int)

;; member_alt__my_rec__d__first__bit_axiom
  (assert (<= 0 member_alt__my_rec__d__first__bit2))

;; member_alt__my_rec__d__last__bit_axiom
  (assert
  (< member_alt__my_rec__d__first__bit2 member_alt__my_rec__d__last__bit2))

;; member_alt__my_rec__d__position_axiom
  (assert (<= 0 member_alt__my_rec__d__position2))

(declare-const member_alt__my_rec__f__first__bit2 Int)

(declare-const member_alt__my_rec__f__last__bit2 Int)

(declare-const member_alt__my_rec__f__position2 Int)

;; member_alt__my_rec__f__first__bit_axiom
  (assert (<= 0 member_alt__my_rec__f__first__bit2))

;; member_alt__my_rec__f__last__bit_axiom
  (assert
  (< member_alt__my_rec__f__first__bit2 member_alt__my_rec__f__last__bit2))

;; member_alt__my_rec__f__position_axiom
  (assert (<= 0 member_alt__my_rec__f__position2))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((t12b__ref 0))
(((t12b__refqtmk (t12b__content us_rep)))))
(define-fun t12b__ref_t12b__content__projection ((a t12b__ref)) us_rep 
  (t12b__content a))

;; oeq__post_axiom
  (assert true)

;; oeq__def_axiom
  (assert
  (forall ((x us_rep) (y us_rep))
  (! (= (= (oeq x y) true)
     (= (= (rec__member_alt__my_rec__d (us_split_discrs1 x)) true)
     (= (rec__member_alt__my_rec__d (us_split_discrs1 y)) true))) :pattern (
  (oeq x y)) )))

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (and
     (forall ((a1 us_rep) (b1 us_rep)) (oeq__function_guard (oeq a1 b1) a1
     b1)) (= (user_eq3 a b) (oeq a b))) :pattern ((user_eq3 a b)) )))

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (and
     (forall ((a1 us_rep) (b1 us_rep)) (oeq__function_guard (oeq a1 b1) a1
     b1)) (= (user_eq2 a b) (oeq a b))) :pattern ((user_eq2 a b)) )))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

(assert
;; defqtvc
 ;; File "member_alt.adb", line 18, characters 0-0
  (not
  (forall ((x__split_fields integer))
  (=> (= x__split_fields rliteral)
  (=> (= x__split_discrs (us_split_discrsqtmk (distinct 1 0)))
  (let ((temp___198 (us_repqtmk x__split_discrs
                    (us_split_fieldsqtmk x__split_fields))))
  (or (=> (f__function_guard (f 1) 1) (= (user_eq1 temp___198 (f 1)) true))
  (=> (f__function_guard (f 2) 2) (= (user_eq1 temp___198 (f 2)) true)))))))))
(check-sat)
(exit)
