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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__p__pt__x integer)))))
(define-fun us_split_discrs_rec__p__pt__x__projection ((a us_split_discrs)) integer 
  (rec__p__pt__x a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_discrs1 us_split_discrs)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun in_range1 ((rec__p__pt__x1 Int)
  (a us_split_discrs)) Bool (= rec__p__pt__x1 (to_rep (rec__p__pt__x a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const p__pt__x__first__bit Int)

(declare-const p__pt__x__last__bit Int)

(declare-const p__pt__x__position Int)

;; p__pt__x__first__bit_axiom
  (assert (<= 0 p__pt__x__first__bit))

;; p__pt__x__last__bit_axiom
  (assert (< p__pt__x__first__bit p__pt__x__last__bit))

;; p__pt__x__position_axiom
  (assert (<= 0 p__pt__x__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-datatypes ((pt__ref 0))
(((pt__refqtmk (pt__content us_rep)))))
(define-fun pt__ref_pt__content__projection ((a pt__ref)) us_rep (pt__content
                                                                 a))

(declare-const po__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ((us_split_discrs2 0))
(((us_split_discrsqtmk1 (rec__p__tt__x integer)))))
(define-fun us_split_discrs_rec__p__tt__x__projection ((a us_split_discrs2)) integer 
  (rec__p__tt__x a))

(declare-datatypes ((us_split_discrs__ref1 0))
(((us_split_discrs__refqtmk1 (us_split_discrs__content1 us_split_discrs2)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref1)) us_split_discrs2 
  (us_split_discrs__content1 a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__p__tt us_main_type)))))
(define-fun us_split_fields_rec__p__tt__projection ((a us_split_fields)) us_main_type 
  (rec__p__tt a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs3 us_split_discrs2)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs2 
  (us_split_discrs3 a))

(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun in_range2 ((rec__p__tt__x1 Int)
  (a us_split_discrs2)) Bool (= rec__p__tt__x1 (to_rep (rec__p__tt__x a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const p__tt__x__first__bit Int)

(declare-const p__tt__x__last__bit Int)

(declare-const p__tt__x__position Int)

;; p__tt__x__first__bit_axiom
  (assert (<= 0 p__tt__x__first__bit))

;; p__tt__x__last__bit_axiom
  (assert (< p__tt__x__first__bit p__tt__x__last__bit))

;; p__tt__x__position_axiom
  (assert (<= 0 p__tt__x__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-datatypes ((tt__ref 0))
(((tt__refqtmk (tt__content us_rep1)))))
(define-fun tt__ref_tt__content__projection ((a tt__ref)) us_rep1 (tt__content
                                                                  a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__p__tt1 us_main_type)))))
(define-fun us_split_fields_rec__p__tt__2__projection ((a us_split_fields2)) us_main_type 
  (rec__p__tt1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2
  (us_split_discrs4 us_split_discrs2)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__4__projection ((a us_rep2)) us_split_discrs2 
  (us_split_discrs4 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep2)) us_split_fields2 
  (us_split_fields3 a))

(define-fun to_base ((a us_rep2)) us_rep1 (us_repqtmk1 (us_split_discrs4 a)
                                          (us_split_fieldsqtmk
                                          (rec__p__tt1 (us_split_fields3 a)))))

(define-fun of_base ((r us_rep1)) us_rep2 (us_repqtmk2 (us_split_discrs3 r)
                                          (us_split_fieldsqtmk1
                                          (rec__p__tt (us_split_fields1 r)))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const p__tt__x__first__bit1 Int)

(declare-const p__tt__x__last__bit1 Int)

(declare-const p__tt__x__position1 Int)

;; p__tt__x__first__bit_axiom
  (assert (<= 0 p__tt__x__first__bit1))

;; p__tt__x__last__bit_axiom
  (assert (< p__tt__x__first__bit1 p__tt__x__last__bit1))

;; p__tt__x__position_axiom
  (assert (<= 0 p__tt__x__position1))

(declare-fun user_eq3 (us_rep2 us_rep2) Bool)

(declare-datatypes ((ttoS__ref 0))
(((ttoS__refqtmk (ttoS__content us_rep2)))))
(define-fun ttoS__ref_ttoS__content__projection ((a ttoS__ref)) us_rep2 
  (ttoS__content a))

(declare-const to____split_discrs us_split_discrs2)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_200 us_rep2)
  (temp___is_init_196 Bool) (temp___skip_constant_197 Bool)
  (temp___do_toplevel_198 Bool)
  (temp___do_typ_inv_199 Bool)) Bool (=>
                                     (not (= temp___skip_constant_197 true))
                                     (in_range2 0
                                     (us_split_discrs3
                                     (to_base temp___expr_200)))))

(define-fun default_initial_assumption ((temp___expr_202 us_rep2)
  (temp___skip_top_level_203 Bool)) Bool (= (to_rep
                                            (rec__p__tt__x
                                            (us_split_discrs4
                                            temp___expr_202))) 0))

(declare-const po_x Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const to_x Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-datatypes ((us_rep3 0))
(((us_repqtmk3 (us_split_discrs5 us_split_discrs)))))
(define-fun us_rep___split_discrs__3__projection ((a us_rep3)) us_split_discrs 
  (us_split_discrs5 a))

(define-fun to_base1 ((a us_rep3)) us_rep (us_repqtmk (us_split_discrs5 a)))

(define-fun of_base1 ((r us_rep)) us_rep3 (us_repqtmk3 (us_split_discrs1 r)))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const p__pt__x__first__bit1 Int)

(declare-const p__pt__x__last__bit1 Int)

(declare-const p__pt__x__position1 Int)

;; p__pt__x__first__bit_axiom
  (assert (<= 0 p__pt__x__first__bit1))

;; p__pt__x__last__bit_axiom
  (assert (< p__pt__x__first__bit1 p__pt__x__last__bit1))

;; p__pt__x__position_axiom
  (assert (<= 0 p__pt__x__position1))

(declare-fun user_eq4 (us_rep3 us_rep3) Bool)

(declare-datatypes ((tpoS__ref 0))
(((tpoS__refqtmk (tpoS__content us_rep3)))))
(define-fun tpoS__ref_tpoS__content__projection ((a tpoS__ref)) us_rep3 
  (tpoS__content a))

(define-fun dynamic_invariant2 ((temp___expr_191 us_rep3)
  (temp___is_init_187 Bool) (temp___skip_constant_188 Bool)
  (temp___do_toplevel_189 Bool)
  (temp___do_typ_inv_190 Bool)) Bool (=>
                                     (not (= temp___skip_constant_188 true))
                                     (in_range1 0
                                     (us_split_discrs1
                                     (to_base1 temp___expr_191)))))

(define-fun default_initial_assumption1 ((temp___expr_193 us_rep3)
  (temp___skip_top_level_194 Bool)) Bool (= (to_rep
                                            (rec__p__pt__x
                                            (us_split_discrs5
                                            temp___expr_193))) 0))

(assert
;; defqtvc
 ;; File "p.ads", line 1, characters 0-0
  (not
  (forall ((to____split_fields us_main_type) (p__po_x__assume Int)
  (p__to_x__assume Int))
  (=> (in_range 0)
  (=> (default_initial_assumption1 (us_repqtmk3 po__split_discrs) false)
  (=> (dynamic_invariant2 (us_repqtmk3 po__split_discrs) false false true
  true)
  (=> (in_range 0)
  (=> (default_initial_assumption
  (us_repqtmk2 to____split_discrs (us_split_fieldsqtmk1 to____split_fields))
  false)
  (=> (dynamic_invariant1
  (us_repqtmk2 to____split_discrs (us_split_fieldsqtmk1 to____split_fields))
  false false true true)
  (=> (dynamic_invariant2 (us_repqtmk3 po__split_discrs) true true true true)
  (=> (= (to_rep (rec__p__pt__x po__split_discrs)) p__po_x__assume)
  (=> (= p__po_x__assume po_x)
  (=> (dynamic_invariant po_x true false true true)
  (=> (= (to_rep (rec__p__tt__x to____split_discrs)) p__to_x__assume)
  (=> (= p__to_x__assume to_x)
  (=> (dynamic_invariant to_x true false true true) (= po_x 0)))))))))))))))))
(check-sat)
(exit)
