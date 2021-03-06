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

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__p__pt__d Bool)))))
(define-fun us_split_discrs_rec__p__pt__d__projection ((a us_split_discrs)) Bool 
  (rec__p__pt__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_discrs1 us_split_discrs)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun in_range1 ((rec__p__pt__d1 Bool)
  (a us_split_discrs)) Bool (= rec__p__pt__d1 (rec__p__pt__d a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const p__pt__d__first__bit Int)

(declare-const p__pt__d__last__bit Int)

(declare-const p__pt__d__position Int)

;; p__pt__d__first__bit_axiom
  (assert (<= 0 p__pt__d__first__bit))

;; p__pt__d__last__bit_axiom
  (assert (< p__pt__d__first__bit p__pt__d__last__bit))

;; p__pt__d__position_axiom
  (assert (<= 0 p__pt__d__position))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-datatypes ((pt__ref 0))
(((pt__refqtmk (pt__content us_rep)))))
(define-fun pt__ref_pt__content__projection ((a pt__ref)) us_rep (pt__content
                                                                 a))

(declare-const p1__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const p2__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_discrs2 us_split_discrs)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs2 a))

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk (us_split_discrs2 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1 (us_split_discrs1 r)))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const p__pt__d__first__bit1 Int)

(declare-const p__pt__d__last__bit1 Int)

(declare-const p__pt__d__position1 Int)

;; p__pt__d__first__bit_axiom
  (assert (<= 0 p__pt__d__first__bit1))

;; p__pt__d__last__bit_axiom
  (assert (< p__pt__d__first__bit1 p__pt__d__last__bit1))

;; p__pt__d__position_axiom
  (assert (<= 0 p__pt__d__position1))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-datatypes ((tp1S__ref 0))
(((tp1S__refqtmk (tp1S__content us_rep1)))))
(define-fun tp1S__ref_tp1S__content__projection ((a tp1S__ref)) us_rep1 
  (tp1S__content a))

(define-fun dynamic_invariant ((temp___expr_185 us_rep1)
  (temp___is_init_181 Bool) (temp___skip_constant_182 Bool)
  (temp___do_toplevel_183 Bool)
  (temp___do_typ_inv_184 Bool)) Bool (=>
                                     (not (= temp___skip_constant_182 true))
                                     (in_range1 (distinct 1 0)
                                     (us_split_discrs1
                                     (to_base temp___expr_185)))))

(define-fun default_initial_assumption ((temp___expr_187 us_rep1)
  (temp___skip_top_level_188 Bool)) Bool (= (rec__p__pt__d
                                            (us_split_discrs2
                                            temp___expr_187)) (distinct 1 0)))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2 (us_split_discrs3 us_split_discrs)))))
(define-fun us_rep___split_discrs__3__projection ((a us_rep2)) us_split_discrs 
  (us_split_discrs3 a))

(define-fun to_base1 ((a us_rep2)) us_rep (us_repqtmk (us_split_discrs3 a)))

(define-fun of_base1 ((r us_rep)) us_rep2 (us_repqtmk2 (us_split_discrs1 r)))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const p__pt__d__first__bit2 Int)

(declare-const p__pt__d__last__bit2 Int)

(declare-const p__pt__d__position2 Int)

;; p__pt__d__first__bit_axiom
  (assert (<= 0 p__pt__d__first__bit2))

;; p__pt__d__last__bit_axiom
  (assert (< p__pt__d__first__bit2 p__pt__d__last__bit2))

;; p__pt__d__position_axiom
  (assert (<= 0 p__pt__d__position2))

(declare-fun user_eq2 (us_rep2 us_rep2) Bool)

(declare-datatypes ((tp2S__ref 0))
(((tp2S__refqtmk (tp2S__content us_rep2)))))
(define-fun tp2S__ref_tp2S__content__projection ((a tp2S__ref)) us_rep2 
  (tp2S__content a))

(define-fun dynamic_invariant1 ((temp___expr_194 us_rep2)
  (temp___is_init_190 Bool) (temp___skip_constant_191 Bool)
  (temp___do_toplevel_192 Bool)
  (temp___do_typ_inv_193 Bool)) Bool (=>
                                     (not (= temp___skip_constant_191 true))
                                     (in_range1 (distinct 0 0)
                                     (us_split_discrs1
                                     (to_base1 temp___expr_194)))))

(define-fun default_initial_assumption1 ((temp___expr_196 us_rep2)
  (temp___skip_top_level_197 Bool)) Bool (= (rec__p__pt__d
                                            (us_split_discrs3
                                            temp___expr_196)) (distinct 0 0)))

(assert
;; defqtvc
 ;; File "p.ads", line 1, characters 0-0
  (not (in_range 1)))
(check-sat)
(exit)
