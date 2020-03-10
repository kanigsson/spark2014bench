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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__foo__thing__d natural)))))
(define-fun us_split_discrs_rec__foo__thing__d__projection ((a us_split_discrs)) natural 
  (rec__foo__thing__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__foo__thing__a Bool)(rec__foo__thing__x Bool)))))
(define-fun us_split_fields_rec__foo__thing__a__projection ((a us_split_fields)) Bool 
  (rec__foo__thing__a a))

(define-fun us_split_fields_rec__foo__thing__x__projection ((a us_split_fields)) Bool 
  (rec__foo__thing__x a))

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

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(define-fun in_range1 ((rec__foo__thing__d1 Int)
  (a us_split_discrs)) Bool (= rec__foo__thing__d1 (to_rep
                                                   (rec__foo__thing__d a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const foo__thing__d__first__bit Int)

(declare-const foo__thing__d__last__bit Int)

(declare-const foo__thing__d__position Int)

;; foo__thing__d__first__bit_axiom
  (assert (<= 0 foo__thing__d__first__bit))

;; foo__thing__d__last__bit_axiom
  (assert (< foo__thing__d__first__bit foo__thing__d__last__bit))

;; foo__thing__d__position_axiom
  (assert (<= 0 foo__thing__d__position))

(declare-const foo__thing__a__first__bit Int)

(declare-const foo__thing__a__last__bit Int)

(declare-const foo__thing__a__position Int)

;; foo__thing__a__first__bit_axiom
  (assert (<= 0 foo__thing__a__first__bit))

;; foo__thing__a__last__bit_axiom
  (assert (< foo__thing__a__first__bit foo__thing__a__last__bit))

;; foo__thing__a__position_axiom
  (assert (<= 0 foo__thing__a__position))

(declare-const foo__thing__x__first__bit Int)

(declare-const foo__thing__x__last__bit Int)

(declare-const foo__thing__x__position Int)

;; foo__thing__x__first__bit_axiom
  (assert (<= 0 foo__thing__x__first__bit))

;; foo__thing__x__last__bit_axiom
  (assert (< foo__thing__x__first__bit foo__thing__x__last__bit))

;; foo__thing__x__position_axiom
  (assert (<= 0 foo__thing__x__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-datatypes ((thing__ref 0))
(((thing__refqtmk (thing__content us_rep)))))
(define-fun thing__ref_thing__content__projection ((a thing__ref)) us_rep 
  (thing__content a))

(declare-fun p_func (us_rep) Bool)

(declare-fun p_func__function_guard (Bool us_rep) Bool)

;; p_func__post_axiom
  (assert true)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__foo__thing__a1 Bool)(rec__foo__thing__x1 Bool)))))
(define-fun us_split_fields_rec__foo__thing__a__2__projection ((a us_split_fields2)) Bool 
  (rec__foo__thing__a1 a))

(define-fun us_split_fields_rec__foo__thing__x__2__projection ((a us_split_fields2)) Bool 
  (rec__foo__thing__x1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs2 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs2 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk (us_split_discrs2 a)
                                         (us_split_fieldsqtmk
                                         (rec__foo__thing__a1
                                         (us_split_fields3 a))
                                         (rec__foo__thing__x1
                                         (us_split_fields3 a)))))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1 (us_split_discrs1 r)
                                         (us_split_fieldsqtmk1
                                         (rec__foo__thing__a
                                         (us_split_fields1 r))
                                         (rec__foo__thing__x
                                         (us_split_fields1 r)))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const foo__thing__d__first__bit1 Int)

(declare-const foo__thing__d__last__bit1 Int)

(declare-const foo__thing__d__position1 Int)

;; foo__thing__d__first__bit_axiom
  (assert (<= 0 foo__thing__d__first__bit1))

;; foo__thing__d__last__bit_axiom
  (assert (< foo__thing__d__first__bit1 foo__thing__d__last__bit1))

;; foo__thing__d__position_axiom
  (assert (<= 0 foo__thing__d__position1))

(declare-const foo__thing__a__first__bit1 Int)

(declare-const foo__thing__a__last__bit1 Int)

(declare-const foo__thing__a__position1 Int)

;; foo__thing__a__first__bit_axiom
  (assert (<= 0 foo__thing__a__first__bit1))

;; foo__thing__a__last__bit_axiom
  (assert (< foo__thing__a__first__bit1 foo__thing__a__last__bit1))

;; foo__thing__a__position_axiom
  (assert (<= 0 foo__thing__a__position1))

(declare-const foo__thing__x__first__bit1 Int)

(declare-const foo__thing__x__last__bit1 Int)

(declare-const foo__thing__x__position1 Int)

;; foo__thing__x__first__bit_axiom
  (assert (<= 0 foo__thing__x__first__bit1))

;; foo__thing__x__last__bit_axiom
  (assert (< foo__thing__x__first__bit1 foo__thing__x__last__bit1))

;; foo__thing__x__position_axiom
  (assert (<= 0 foo__thing__x__position1))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-datatypes ((tpo_1S__ref 0))
(((tpo_1S__refqtmk (tpo_1S__content us_rep1)))))
(define-fun tpo_1S__ref_tpo_1S__content__projection ((a tpo_1S__ref)) us_rep1 
  (tpo_1S__content a))

(declare-const po_1__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun in_range2 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(define-fun dynamic_invariant1 ((temp___expr_188 us_rep1)
  (temp___is_init_184 Bool) (temp___skip_constant_185 Bool)
  (temp___do_toplevel_186 Bool)
  (temp___do_typ_inv_187 Bool)) Bool (=>
                                     (not (= temp___skip_constant_185 true))
                                     (in_range1 12
                                     (us_split_discrs1
                                     (to_base temp___expr_188)))))

(define-fun default_initial_assumption ((temp___expr_190 us_rep1)
  (temp___skip_top_level_191 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__foo__thing__d
                                            (us_split_discrs2
                                            temp___expr_190))) 12)
                                         (and
                                         (= (rec__foo__thing__a1
                                            (us_split_fields3
                                            temp___expr_190)) (distinct 0 0))
                                         (= (rec__foo__thing__x1
                                            (us_split_fields3
                                            temp___expr_190)) (> (to_rep
                                                                 (rec__foo__thing__d
                                                                 (us_split_discrs2
                                                                 temp___expr_190))) 5)))))

(declare-const d Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort priority 0)

(declare-fun priorityqtint (priority) Int)

;; priority'axiom
  (assert
  (forall ((i priority))
  (and (<= 0 (priorityqtint i)) (<= (priorityqtint i) 97))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 97)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (priority priority) Bool)

(declare-const dummy1 priority)

(declare-datatypes ((priority__ref 0))
(((priority__refqtmk (priority__content priority)))))
(define-fun priority__ref_priority__content__projection ((a priority__ref)) priority 
  (priority__content a))

(define-fun dynamic_invariant2 ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (<= 0 97)) (in_range3 temp___expr_168)))

(assert
;; defqtvc
 ;; File "foo.adb", line 43, characters 0-0
  (not
  (forall ((po_1__split_fields us_split_fields2)
  (po_1__split_fields1 us_split_fields2) (us_self__compl us_rep))
  (=> (dynamic_invariant1 (us_repqtmk1 po_1__split_discrs po_1__split_fields)
  true false true true)
  (=> (dynamic_invariant d true false true true)
  (=> (dynamic_invariant1
  (us_repqtmk1 po_1__split_discrs po_1__split_fields1) true true true true)
  (let ((temp___221 (of_base us_self__compl)))
  (forall ((po_1__split_fields2 us_split_fields2))
  (=> (= po_1__split_fields2 (us_split_fields3 temp___221))
  (=> (= po_1__split_discrs (us_split_discrs2 temp___221))
  (forall ((po_1__split_fields3 us_split_fields2))
  (=> (dynamic_invariant1
  (us_repqtmk1 po_1__split_discrs po_1__split_fields3) true true true true)
  (let ((o (to_base (us_repqtmk1 po_1__split_discrs po_1__split_fields3))))
  (let ((o1 (p_func o)))
  (=> (p_func__function_guard o1 o)
  (forall ((b Bool))
  (=> (= b o1)
  (forall ((po_1__split_fields4 us_split_fields2))
  (=> (dynamic_invariant1
  (us_repqtmk1 po_1__split_discrs po_1__split_fields4) true true true true)
  (< 10 42))))))))))))))))))))
(check-sat)
(exit)
