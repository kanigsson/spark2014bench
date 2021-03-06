(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-fun nth ((_ BitVec 8) Int) Bool)

(declare-fun lsr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun asr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun lsl ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun rotate_right1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2int x) (- (- 256 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 255)))

(declare-fun nth_bv ((_ BitVec 8) (_ BitVec 8)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

(define-fun eq_sub ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 8))))))
(declare-fun power ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun bv_min ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) y x))

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array (_ BitVec 8) Bool))))))
(declare-fun slide ((Array (_ BitVec 8) Bool) (_ BitVec 8)
  (_ BitVec 8)) (Array (_ BitVec 8) Bool))

;; slide_eq
  (assert
  (forall ((a (Array (_ BitVec 8) Bool)))
  (forall ((first (_ BitVec 8)))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array (_ BitVec 8) Bool)))
  (forall ((old_first (_ BitVec 8)))
  (forall ((new_first (_ BitVec 8)))
  (forall ((i (_ BitVec 8)))
  (! (= (select (slide a old_first new_first) i) (select a (bvsub i (bvsub new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array (_ BitVec 8) Bool)) (a__first (_ BitVec 8))
  (a__last (_ BitVec 8)) (b (Array (_ BitVec 8) Bool))
  (b__first (_ BitVec 8))
  (b__last (_ BitVec 8))) Bool (ite (and
                                    (ite (bvule a__first a__last)
                                    (and (bvule b__first b__last)
                                    (= (bvsub a__last a__first) (bvsub b__last b__first)))
                                    (bvugt b__first b__last))
                                    (forall ((temp___idx_154 (_ BitVec 8)))
                                    (=>
                                    (and (bvule a__first temp___idx_154)
                                    (bvule temp___idx_154 a__last))
                                    (= (ite (select a temp___idx_154) 1 0) (ite (select b (bvadd (bvsub b__first a__first) temp___idx_154)) 1 0)))))
                               true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array (_ BitVec 8) Bool)) (b (Array (_ BitVec 8) Bool)))
  (forall ((a__first (_ BitVec 8)) (a__last (_ BitVec 8))
  (b__first (_ BitVec 8)) (b__last (_ BitVec 8)))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (bvule a__first a__last)
  (and (bvule b__first b__last)
  (= (bvsub a__last a__first) (bvsub b__last b__first)))
  (bvugt b__first b__last))
  (forall ((temp___idx_154 (_ BitVec 8)))
  (=> (and (bvule a__first temp___idx_154) (bvule temp___idx_154 a__last))
  (= (ite (select a temp___idx_154) 1 0) (ite (select b (bvadd (bvsub b__first a__first) temp___idx_154)) 1 0)))))))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun current_chain_length ((Array (_ BitVec 8) Bool)) (_ BitVec 8))

(declare-fun current_chain_length__function_guard ((_ BitVec 8)
  (Array (_ BitVec 8) Bool)) Bool)

(declare-sort time_slot_length 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(define-fun in_range1 ((x (_ BitVec 8))) Bool (and (bvule #x00 x)
                                              (bvule x #x0A)))

(define-fun in_range_int ((x Int)) Bool (and (<= 0 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 8))

(declare-fun user_eq (time_slot_length time_slot_length) Bool)

(declare-const dummy time_slot_length)

(declare-datatypes ()
((time_slot_length__ref
 (time_slot_length__refqtmk (time_slot_length__content time_slot_length)))))
(define-fun time_slot_length__ref_time_slot_length__content__projection ((a time_slot_length__ref)) time_slot_length 
  (time_slot_length__content a))

(define-fun dynamic_invariant ((temp___expr_169 (_ BitVec 8))
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (bvule #x00 #x0A)) (in_range1
                                     temp___expr_169)))

;; current_chain_length__post_axiom
  (assert
  (forall ((counter__model__inputs (Array (_ BitVec 8) Bool)))
  (! (let ((result (current_chain_length counter__model__inputs)))
     (=> (current_chain_length__function_guard result counter__model__inputs)
     (and
     (ite (not (= (select counter__model__inputs #x0A) true)) (= result #x00)
     (and
     (forall ((i (_ BitVec 8)))
     (=> (and (bvule (bvadd (bvsub #x0A result) #x01) i) (bvule i #x0A))
     (= (select counter__model__inputs i) true)))
     (or (= result #x0A)
     (not (= (select counter__model__inputs (bvsub #x0A result)) true)))))
     (dynamic_invariant result true false true true)))) :pattern ((current_chain_length
                                                                  counter__model__inputs)) )))

(declare-const input Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const a (_ BitVec 8))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort time_slot 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 8))

(define-fun in_range2 ((x (_ BitVec 8))) Bool (and (bvule #x01 x)
                                              (bvule x #x0A)))

(define-fun in_range_int1 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 8))

(declare-fun user_eq1 (time_slot time_slot) Bool)

(declare-const dummy1 time_slot)

(declare-datatypes ()
((time_slot__ref (time_slot__refqtmk (time_slot__content time_slot)))))
(define-fun time_slot__ref_time_slot__content__projection ((a1 time_slot__ref)) time_slot 
  (time_slot__content a1))

(define-fun dynamic_invariant1 ((temp___expr_176 (_ BitVec 8))
  (temp___is_init_172 Bool) (temp___skip_constant_173 Bool)
  (temp___do_toplevel_174 Bool)
  (temp___do_typ_inv_175 Bool)) Bool (=>
                                     (or (= temp___is_init_172 true)
                                     (bvule #x01 #x0A)) (in_range2
                                     temp___expr_176)))

(declare-const count (_ BitVec 8))

(declare-const inputs (Array (_ BitVec 8) Bool))

;; Assume
  (assert (dynamic_invariant count true false true true))

;; H
  (assert
  (forall ((inputs1 (Array (_ BitVec 8) Bool)))
  (current_chain_length__function_guard (current_chain_length inputs1)
  inputs1)))

;; Assume
  (assert (= (current_chain_length inputs) count))

(declare-const inputs1 (Array (_ BitVec 8) Bool))

;; H
  (assert (= inputs1 inputs))

(declare-const inputs2 (Array (_ BitVec 8) Bool))

;; H
  (assert
  (forall ((k (_ BitVec 8)))
  (=> (and (bvule #x01 k) (bvule k #x09))
  (= (= (select inputs2 k) true) (= (select inputs1 (bvadd k #x01)) true)))))

;; H
  (assert (= (= (select inputs2 #x0A) true) (= input true)))

(declare-const count1 (_ BitVec 8))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (= input true) false true)))

(declare-const spark__branch1 Bool)

;; H
  (assert
  (ite (= spark__branch true) (= count1 #x00)
  (and (= spark__branch1 (ite (bvult count #x0A) true false))
  (ite (= spark__branch1 true)
  (let ((o (bvadd count #x01))) (and (in_range1 o) (= count1 o)))
  (= count1 count)))))

(define-fun counter__p__B_3__a__assume () (_ BitVec 8) (current_chain_length
                                                       inputs2))

;; H
  (assert (current_chain_length__function_guard counter__p__B_3__a__assume
  inputs2))

;; H
  (assert (dynamic_invariant counter__p__B_3__a__assume true false true
  true))

;; H
  (assert
  (ite (not (= (select inputs2 #x0A) true))
  (= counter__p__B_3__a__assume #x00)
  (and
  (forall ((i (_ BitVec 8)))
  (=>
  (and (bvule (bvadd (bvsub #x0A counter__p__B_3__a__assume) #x01) i)
  (bvule i #x0A)) (= (select inputs2 i) true)))
  (or (= counter__p__B_3__a__assume #x0A)
  (not (= (select inputs2 (bvsub #x0A counter__p__B_3__a__assume)) true))))))

;; Assume
  (assert (= counter__p__B_3__a__assume a))

;; Assume
  (assert (dynamic_invariant a true false true true))

;; Assert
  (assert
  (=> (= input true)
  (forall ((i (_ BitVec 8)))
  (=> (and (bvule (bvadd (bvsub #x0A a) #x01) i) (bvule i #x0A))
  (= (select inputs2 i) true)))))

;; Assert
  (assert
  (=> (= input true)
  (or (= a #x0A) (not (= (select inputs2 (bvsub #x0A a)) true)))))

;; H
  (assert
  (forall ((inputs3 (Array (_ BitVec 8) Bool)))
  (current_chain_length__function_guard (current_chain_length inputs3)
  inputs3)))

;; Assert
  (assert
  (=> (and (= input true) (bvult count1 #x0A))
  (= (current_chain_length inputs2) count1)))

;; H
  (assert
  (forall ((inputs3 (Array (_ BitVec 8) Bool)))
  (current_chain_length__function_guard (current_chain_length inputs3)
  inputs3)))

(assert
;; defqtvc
 ;; File "counter.ads", line 38, characters 0-0
  (not (= (current_chain_length inputs2) count1)))
(check-sat)

(exit)
