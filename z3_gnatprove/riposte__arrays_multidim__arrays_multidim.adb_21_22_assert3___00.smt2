;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
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

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

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

(declare-sort map1 0)

(declare-datatypes () ((map__ref (map__refqtmk (map__content map1)))))
(declare-fun get (map1 (_ BitVec 8) (_ BitVec 8)) natural)

(declare-fun set (map1 (_ BitVec 8) (_ BitVec 8) natural) map1)

;; Select_eq
  (assert
  (forall ((m map1))
  (forall ((i (_ BitVec 8)))
  (forall ((j (_ BitVec 8)))
  (forall ((a natural))
  (! (= (get (set m i j a) i j) a) :pattern ((set m i j a)) ))))))

;; Select_neq
  (assert
  (forall ((m map1))
  (forall ((i (_ BitVec 8)) (i2 (_ BitVec 8)))
  (forall ((j (_ BitVec 8)) (j2 (_ BitVec 8)))
  (forall ((a natural))
  (! (=> (not (and (= i i2) (= j j2)))
     (= (get (set m i j a) i2 j2) (get m i2 j2))) :pattern ((get
                                                            (set m i j a) i2
                                                            j2)) :pattern (
  (set m i j a) (get m i2 j2)) ))))))

(declare-fun slide (map1 (_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) map1)

;; slide_def
  (assert
  (forall ((a map1))
  (forall ((new_first (_ BitVec 8)) (old_first (_ BitVec 8)))
  (forall ((new_first_2 (_ BitVec 8)) (old_first_2 (_ BitVec 8)))
  (forall ((i (_ BitVec 8)))
  (forall ((j (_ BitVec 8)))
  (! (= (get (slide a old_first new_first old_first_2 new_first_2) i j) 
  (get a (bvsub i (bvsub new_first old_first))
  (bvsub j (bvsub new_first_2 old_first_2)))) :pattern ((get
                                                        (slide a old_first
                                                        new_first old_first_2
                                                        new_first_2) i j)) )))))))

(define-fun bool_eq ((a map1) (a__first (_ BitVec 8)) (a__last (_ BitVec 8))
  (a__first_2 (_ BitVec 8)) (a__last_2 (_ BitVec 8)) (b map1)
  (b__first (_ BitVec 8)) (b__last (_ BitVec 8)) (b__first_2 (_ BitVec 8))
  (b__last_2 (_ BitVec 8))) Bool (ite (and
                                      (and
                                      (ite (bvule a__first a__last)
                                      (and (bvule b__first b__last)
                                      (= (bvsub a__last a__first) (bvsub b__last b__first)))
                                      (bvugt b__first b__last))
                                      (ite (bvule a__first_2 a__last_2)
                                      (and (bvule b__first_2 b__last_2)
                                      (= (bvsub a__last_2 a__first_2) (bvsub b__last_2 b__first_2)))
                                      (bvugt b__first_2 b__last_2)))
                                      (forall ((temp___idx_154 (_ BitVec 8))
                                      (temp___idx_155 (_ BitVec 8)))
                                      (=>
                                      (and
                                      (and (bvule a__first temp___idx_154)
                                      (bvule temp___idx_154 a__last))
                                      (and (bvule a__first_2 temp___idx_155)
                                      (bvule temp___idx_155 a__last_2)))
                                      (= (to_rep
                                         (get a temp___idx_154
                                         temp___idx_155)) (to_rep
                                                          (get b
                                                          (bvadd (bvsub b__first a__first) temp___idx_154)
                                                          (bvadd (bvsub b__first_2 a__first_2) temp___idx_155)))))))
                                 true false))

;; bool_eq_rev
  (assert
  (forall ((a map1) (b map1))
  (forall ((a__first (_ BitVec 8)) (a__last (_ BitVec 8))
  (a__first_2 (_ BitVec 8)) (a__last_2 (_ BitVec 8)) (b__first (_ BitVec 8))
  (b__last (_ BitVec 8)) (b__first_2 (_ BitVec 8)) (b__last_2 (_ BitVec 8)))
  (=>
  (= (bool_eq b b__first b__last b__first_2 b__last_2 a a__first a__last
     a__first_2 a__last_2) true)
  (and
  (and
  (ite (bvule a__first a__last)
  (and (bvule b__first b__last)
  (= (bvsub a__last a__first) (bvsub b__last b__first)))
  (bvugt b__first b__last))
  (ite (bvule a__first_2 a__last_2)
  (and (bvule b__first_2 b__last_2)
  (= (bvsub a__last_2 a__first_2) (bvsub b__last_2 b__first_2)))
  (bvugt b__first_2 b__last_2)))
  (forall ((temp___idx_154 (_ BitVec 8)) (temp___idx_155 (_ BitVec 8)))
  (=>
  (and (and (bvule a__first temp___idx_154) (bvule temp___idx_154 a__last))
  (and (bvule a__first_2 temp___idx_155) (bvule temp___idx_155 a__last_2)))
  (= (to_rep (get a temp___idx_154 temp___idx_155)) (to_rep
                                                    (get b
                                                    (bvadd (bvsub b__first a__first) temp___idx_154)
                                                    (bvadd (bvsub b__first_2 a__first_2) temp___idx_155)))))))))))

(declare-const x map1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

;; Assume
  (assert true)

(assert
;; defqtvc
 ;; File "arrays_multidim.adb", line 17, characters 0-0
  (not (< 1 (to_rep (get x #x05 #x05)))))
(check-sat)