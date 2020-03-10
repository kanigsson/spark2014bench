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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort interrupt_id 0)

(declare-fun interrupt_idqtint (interrupt_id) Int)

;; interrupt_id'axiom
  (assert
  (forall ((i interrupt_id))
  (and (<= 0 (interrupt_idqtint i)) (<= (interrupt_idqtint i) 63))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 63)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (interrupt_id interrupt_id) Bool)

(declare-const dummy interrupt_id)

(declare-datatypes ((interrupt_id__ref 0))
(((interrupt_id__refqtmk (interrupt_id__content interrupt_id)))))
(define-fun interrupt_id__ref_interrupt_id__content__projection ((a interrupt_id__ref)) interrupt_id 
  (interrupt_id__content a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__r__pt__irq interrupt_id)))))
(define-fun us_split_discrs_rec__r__pt__irq__projection ((a us_split_discrs)) interrupt_id 
  (rec__r__pt__irq a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_discrs1 us_split_discrs)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun to_rep ((x interrupt_id)) Int (interrupt_idqtint x))

(declare-fun of_rep (Int) interrupt_id)

;; inversion_axiom
  (assert
  (forall ((x interrupt_id))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x interrupt_id)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun in_range2 ((rec__r__pt__irq1 Int)
  (a us_split_discrs)) Bool (= rec__r__pt__irq1 (to_rep (rec__r__pt__irq a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const r__pt__irq__first__bit Int)

(declare-const r__pt__irq__last__bit Int)

(declare-const r__pt__irq__position Int)

;; r__pt__irq__first__bit_axiom
  (assert (<= 0 r__pt__irq__first__bit))

;; r__pt__irq__last__bit_axiom
  (assert (< r__pt__irq__first__bit r__pt__irq__last__bit))

;; r__pt__irq__position_axiom
  (assert (<= 0 r__pt__irq__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-datatypes ((pt__ref 0))
(((pt__refqtmk (pt__content us_rep)))))
(define-fun pt__ref_pt__content__projection ((a pt__ref)) us_rep (pt__content
                                                                 a))

(declare-const po1__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const po2__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const po3__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const po4__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const po5__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

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

(declare-const r__pt__irq__first__bit1 Int)

(declare-const r__pt__irq__last__bit1 Int)

(declare-const r__pt__irq__position1 Int)

;; r__pt__irq__first__bit_axiom
  (assert (<= 0 r__pt__irq__first__bit1))

;; r__pt__irq__last__bit_axiom
  (assert (< r__pt__irq__first__bit1 r__pt__irq__last__bit1))

;; r__pt__irq__position_axiom
  (assert (<= 0 r__pt__irq__position1))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-datatypes ((constrained__ref 0))
(((constrained__refqtmk (constrained__content us_rep1)))))
(define-fun constrained__ref_constrained__content__projection ((a constrained__ref)) us_rep1 
  (constrained__content a))

(define-fun dynamic_invariant ((temp___expr_192 us_rep1)
  (temp___is_init_188 Bool) (temp___skip_constant_189 Bool)
  (temp___do_toplevel_190 Bool)
  (temp___do_typ_inv_191 Bool)) Bool (=>
                                     (not (= temp___skip_constant_189 true))
                                     (in_range2 2
                                     (us_split_discrs1
                                     (to_base temp___expr_192)))))

(define-fun default_initial_assumption ((temp___expr_194 us_rep1)
  (temp___skip_top_level_195 Bool)) Bool (= (to_rep
                                            (rec__r__pt__irq
                                            (us_split_discrs2
                                            temp___expr_194))) 2))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2 (us_split_discrs3 us_split_discrs)))))
(define-fun us_rep___split_discrs__5__projection ((a us_rep2)) us_split_discrs 
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

(declare-const r__pt__irq__first__bit2 Int)

(declare-const r__pt__irq__last__bit2 Int)

(declare-const r__pt__irq__position2 Int)

;; r__pt__irq__first__bit_axiom
  (assert (<= 0 r__pt__irq__first__bit2))

;; r__pt__irq__last__bit_axiom
  (assert (< r__pt__irq__first__bit2 r__pt__irq__last__bit2))

;; r__pt__irq__position_axiom
  (assert (<= 0 r__pt__irq__position2))

(declare-fun user_eq3 (us_rep2 us_rep2) Bool)

(declare-datatypes ((derived_constrained__ref 0))
(((derived_constrained__refqtmk (derived_constrained__content us_rep2)))))
(define-fun derived_constrained__ref_derived_constrained__content__projection ((a derived_constrained__ref)) us_rep2 
  (derived_constrained__content a))

(define-fun dynamic_invariant1 ((temp___expr_207 us_rep2)
  (temp___is_init_203 Bool) (temp___skip_constant_204 Bool)
  (temp___do_toplevel_205 Bool)
  (temp___do_typ_inv_206 Bool)) Bool (=>
                                     (not (= temp___skip_constant_204 true))
                                     (in_range2 4
                                     (us_split_discrs1
                                     (to_base1 temp___expr_207)))))

(define-fun default_initial_assumption1 ((temp___expr_209 us_rep2)
  (temp___skip_top_level_210 Bool)) Bool (= (to_rep
                                            (rec__r__pt__irq
                                            (us_split_discrs3
                                            temp___expr_209))) 4))

(declare-datatypes ((us_rep3 0))
(((us_repqtmk3 (us_split_discrs4 us_split_discrs)))))
(define-fun us_rep___split_discrs__7__projection ((a us_rep3)) us_split_discrs 
  (us_split_discrs4 a))

(define-fun to_base2 ((a us_rep3)) us_rep (us_repqtmk (us_split_discrs4 a)))

(define-fun of_base2 ((r us_rep)) us_rep3 (us_repqtmk3 (us_split_discrs1 r)))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const r__pt__irq__first__bit3 Int)

(declare-const r__pt__irq__last__bit3 Int)

(declare-const r__pt__irq__position3 Int)

;; r__pt__irq__first__bit_axiom
  (assert (<= 0 r__pt__irq__first__bit3))

;; r__pt__irq__last__bit_axiom
  (assert (< r__pt__irq__first__bit3 r__pt__irq__last__bit3))

;; r__pt__irq__position_axiom
  (assert (<= 0 r__pt__irq__position3))

(declare-fun user_eq4 (us_rep3 us_rep3) Bool)

(declare-datatypes ((tpo1S__ref 0))
(((tpo1S__refqtmk (tpo1S__content us_rep3)))))
(define-fun tpo1S__ref_tpo1S__content__projection ((a tpo1S__ref)) us_rep3 
  (tpo1S__content a))

(define-fun dynamic_invariant2 ((temp___expr_222 us_rep3)
  (temp___is_init_218 Bool) (temp___skip_constant_219 Bool)
  (temp___do_toplevel_220 Bool)
  (temp___do_typ_inv_221 Bool)) Bool (=>
                                     (not (= temp___skip_constant_219 true))
                                     (in_range2 1
                                     (us_split_discrs1
                                     (to_base2 temp___expr_222)))))

(define-fun default_initial_assumption2 ((temp___expr_224 us_rep3)
  (temp___skip_top_level_225 Bool)) Bool (= (to_rep
                                            (rec__r__pt__irq
                                            (us_split_discrs4
                                            temp___expr_224))) 1))

(declare-datatypes ((us_rep4 0))
(((us_repqtmk4 (us_split_discrs5 us_split_discrs)))))
(define-fun us_rep___split_discrs__8__projection ((a us_rep4)) us_split_discrs 
  (us_split_discrs5 a))

(define-fun to_base3 ((a us_rep4)) us_rep (us_repqtmk (us_split_discrs5 a)))

(define-fun of_base3 ((r us_rep)) us_rep4 (us_repqtmk4 (us_split_discrs1 r)))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const r__pt__irq__first__bit4 Int)

(declare-const r__pt__irq__last__bit4 Int)

(declare-const r__pt__irq__position4 Int)

;; r__pt__irq__first__bit_axiom
  (assert (<= 0 r__pt__irq__first__bit4))

;; r__pt__irq__last__bit_axiom
  (assert (< r__pt__irq__first__bit4 r__pt__irq__last__bit4))

;; r__pt__irq__position_axiom
  (assert (<= 0 r__pt__irq__position4))

(declare-fun user_eq5 (us_rep4 us_rep4) Bool)

(declare-datatypes ((tpo3S__ref 0))
(((tpo3S__refqtmk (tpo3S__content us_rep4)))))
(define-fun tpo3S__ref_tpo3S__content__projection ((a tpo3S__ref)) us_rep4 
  (tpo3S__content a))

(define-fun dynamic_invariant3 ((temp___expr_231 us_rep4)
  (temp___is_init_227 Bool) (temp___skip_constant_228 Bool)
  (temp___do_toplevel_229 Bool)
  (temp___do_typ_inv_230 Bool)) Bool (=>
                                     (not (= temp___skip_constant_228 true))
                                     (in_range2 3
                                     (us_split_discrs1
                                     (to_base3 temp___expr_231)))))

(define-fun default_initial_assumption3 ((temp___expr_233 us_rep4)
  (temp___skip_top_level_234 Bool)) Bool (= (to_rep
                                            (rec__r__pt__irq
                                            (us_split_discrs5
                                            temp___expr_233))) 3))

(declare-datatypes ((us_rep5 0))
(((us_repqtmk5 (us_split_discrs6 us_split_discrs)))))
(define-fun us_rep___split_discrs__9__projection ((a us_rep5)) us_split_discrs 
  (us_split_discrs6 a))

(define-fun to_base4 ((a us_rep5)) us_rep (us_repqtmk (us_split_discrs6 a)))

(define-fun of_base4 ((r us_rep)) us_rep5 (us_repqtmk5 (us_split_discrs1 r)))

(declare-const value__size5 Int)

(declare-const object__size5 Int)

(declare-const alignment5 Int)

;; value__size_axiom
  (assert (<= 0 value__size5))

;; object__size_axiom
  (assert (<= 0 object__size5))

;; alignment_axiom
  (assert (<= 0 alignment5))

(declare-const r__pt__irq__first__bit5 Int)

(declare-const r__pt__irq__last__bit5 Int)

(declare-const r__pt__irq__position5 Int)

;; r__pt__irq__first__bit_axiom
  (assert (<= 0 r__pt__irq__first__bit5))

;; r__pt__irq__last__bit_axiom
  (assert (< r__pt__irq__first__bit5 r__pt__irq__last__bit5))

;; r__pt__irq__position_axiom
  (assert (<= 0 r__pt__irq__position5))

(declare-fun user_eq6 (us_rep5 us_rep5) Bool)

(declare-datatypes ((tpo5S__ref 0))
(((tpo5S__refqtmk (tpo5S__content us_rep5)))))
(define-fun tpo5S__ref_tpo5S__content__projection ((a tpo5S__ref)) us_rep5 
  (tpo5S__content a))

(define-fun dynamic_invariant4 ((temp___expr_240 us_rep5)
  (temp___is_init_236 Bool) (temp___skip_constant_237 Bool)
  (temp___do_toplevel_238 Bool)
  (temp___do_typ_inv_239 Bool)) Bool (=>
                                     (not (= temp___skip_constant_237 true))
                                     (in_range2 5
                                     (us_split_discrs1
                                     (to_base4 temp___expr_240)))))

(define-fun default_initial_assumption4 ((temp___expr_242 us_rep5)
  (temp___skip_top_level_243 Bool)) Bool (= (to_rep
                                            (rec__r__pt__irq
                                            (us_split_discrs6
                                            temp___expr_242))) 5))

(define-fun dynamic_invariant5 ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= 0 63)) (in_range1 temp___expr_179)))

(assert
;; defqtvc
 ;; File "r.ads", line 3, characters 0-0
  (not (=> (in_range1 2) (in_range1 4))))
(check-sat)
(exit)
