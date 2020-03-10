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

(declare-sort et1 0)

(declare-fun et1qtint (et1) Int)

;; et1'axiom
  (assert (forall ((i et1)) (and (<= 0 (et1qtint i)) (<= (et1qtint i) 99))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 99)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (et1 et1) Bool)

(declare-const dummy et1)

(declare-datatypes ((et1__ref 0))
(((et1__refqtmk (et1__content et1)))))
(define-fun et1__ref_et1__content__projection ((a et1__ref)) et1 (et1__content
                                                                 a))

(define-fun to_rep ((x et1)) Int (et1qtint x))

(declare-fun of_rep (Int) et1)

;; inversion_axiom
  (assert
  (forall ((x et1)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x et1)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort map1 0)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content map1)))))
(declare-fun get (map1 Int Int Int) et1)

(declare-fun set (map1 Int Int Int et1) map1)

;; Select_eq
  (assert
  (forall ((m map1))
  (forall ((i Int))
  (forall ((j Int))
  (forall ((k Int))
  (forall ((a et1))
  (! (= (get (set m i j k a) i j k) a) :pattern ((set m i j k a)) )))))))

;; Select_neq
  (assert
  (forall ((m map1))
  (forall ((i Int) (i2 Int))
  (forall ((j Int) (j2 Int))
  (forall ((k Int) (k2 Int))
  (forall ((a et1))
  (! (=> (not (and (= i i2) (and (= j j2) (= k k2))))
     (= (get (set m i j k a) i2 j2 k2) (get m i2 j2 k2))) :pattern ((get
                                                                    (set m i
                                                                    j k a) i2
                                                                    j2 k2)) :pattern (
  (set m i j k a) (get m i2 j2 k2)) )))))))

(declare-fun slide (map1 Int Int Int Int Int Int) map1)

;; slide_def
  (assert
  (forall ((a map1))
  (forall ((old_first Int) (new_first Int))
  (forall ((old_first_2 Int) (new_first_2 Int))
  (forall ((old_first_3 Int) (new_first_3 Int))
  (forall ((i Int))
  (forall ((j Int))
  (forall ((k Int))
  (! (= (get
        (slide a old_first new_first old_first_2 new_first_2 old_first_3
        new_first_3) i j k) (get a (- i (- new_first old_first))
                            (- j (- new_first_2 old_first_2))
                            (- k (- new_first_3 old_first_3)))) :pattern (
  (get
  (slide a old_first new_first old_first_2 new_first_2 old_first_3
  new_first_3) i j k)) )))))))))

(define-fun bool_eq ((a map1) (a__first Int) (a__last Int) (a__first_2 Int)
  (a__last_2 Int) (a__first_3 Int) (a__last_3 Int) (b map1) (b__first Int)
  (b__last Int) (b__first_2 Int) (b__last_2 Int) (b__first_3 Int)
  (b__last_3 Int)) Bool (ite (and
                             (and
                             (and
                             (ite (<= a__first a__last)
                             (and (<= b__first b__last)
                             (= (- a__last a__first) (- b__last b__first)))
                             (< b__last b__first))
                             (ite (<= a__first_2 a__last_2)
                             (and (<= b__first_2 b__last_2)
                             (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
                             (< b__last_2 b__first_2)))
                             (ite (<= a__first_3 a__last_3)
                             (and (<= b__first_3 b__last_3)
                             (= (- a__last_3 a__first_3) (- b__last_3 b__first_3)))
                             (< b__last_3 b__first_3)))
                             (forall ((temp___idx_154 Int)
                             (temp___idx_155 Int) (temp___idx_156 Int))
                             (=>
                             (and
                             (and
                             (and (<= a__first temp___idx_154)
                             (<= temp___idx_154 a__last))
                             (and (<= a__first_2 temp___idx_155)
                             (<= temp___idx_155 a__last_2)))
                             (and (<= a__first_3 temp___idx_156)
                             (<= temp___idx_156 a__last_3)))
                             (= (to_rep
                                (get a temp___idx_154 temp___idx_155
                                temp___idx_156)) (to_rep
                                                 (get b
                                                 (+ (- b__first a__first) temp___idx_154)
                                                 (+ (- b__first_2 a__first_2) temp___idx_155)
                                                 (+ (- b__first_3 a__first_3) temp___idx_156)))))))
                        true false))

;; bool_eq_rev
  (assert
  (forall ((a map1) (b map1))
  (forall ((a__first Int) (a__last Int) (a__first_2 Int) (a__last_2 Int)
  (a__first_3 Int) (a__last_3 Int) (b__first Int) (b__last Int)
  (b__first_2 Int) (b__last_2 Int) (b__first_3 Int) (b__last_3 Int))
  (=>
  (= (bool_eq b b__first b__last b__first_2 b__last_2 b__first_3 b__last_3 a
     a__first a__last a__first_2 a__last_2 a__first_3 a__last_3) true)
  (and
  (and
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (ite (<= a__first_2 a__last_2)
  (and (<= b__first_2 b__last_2)
  (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
  (< b__last_2 b__first_2)))
  (ite (<= a__first_3 a__last_3)
  (and (<= b__first_3 b__last_3)
  (= (- a__last_3 a__first_3) (- b__last_3 b__first_3)))
  (< b__last_3 b__first_3)))
  (forall ((temp___idx_154 Int) (temp___idx_155 Int) (temp___idx_156 Int))
  (=>
  (and
  (and (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (and (<= a__first_2 temp___idx_155) (<= temp___idx_155 a__last_2)))
  (and (<= a__first_3 temp___idx_156) (<= temp___idx_156 a__last_3)))
  (= (to_rep (get a temp___idx_154 temp___idx_155 temp___idx_156)) (to_rep
                                                                   (get b
                                                                   (+ (- b__first a__first) temp___idx_154)
                                                                   (+ (- b__first_2 a__first_2) temp___idx_155)
                                                                   (+ (- b__first_3 a__first_3) temp___idx_156)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const x2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const x3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const y1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const y2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const y3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const z1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const z2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const z3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const new_val_1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const new_val_2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-sort it1 0)

(declare-fun it1qtint (it1) Int)

;; it1'axiom
  (assert (forall ((i it1)) (and (<= 1 (it1qtint i)) (<= (it1qtint i) 3))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (it1 it1) Bool)

(declare-const dummy1 it1)

(declare-datatypes ((it1__ref 0))
(((it1__refqtmk (it1__content it1)))))
(define-fun it1__ref_it1__content__projection ((a it1__ref)) it1 (it1__content
                                                                 a))

(define-fun dynamic_invariant ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (<= 1 3)) (in_range2 temp___expr_168)))

(declare-sort it2 0)

(declare-fun it2qtint (it2) Int)

;; it2'axiom
  (assert (forall ((i it2)) (and (<= 1 (it2qtint i)) (<= (it2qtint i) 5))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (it2 it2) Bool)

(declare-const dummy2 it2)

(declare-datatypes ((it2__ref 0))
(((it2__refqtmk (it2__content it2)))))
(define-fun it2__ref_it2__content__projection ((a it2__ref)) it2 (it2__content
                                                                 a))

(define-fun dynamic_invariant1 ((temp___expr_175 Int)
  (temp___is_init_171 Bool) (temp___skip_constant_172 Bool)
  (temp___do_toplevel_173 Bool)
  (temp___do_typ_inv_174 Bool)) Bool (=>
                                     (or (= temp___is_init_171 true)
                                     (<= 1 5)) (in_range3 temp___expr_175)))

(declare-sort it3 0)

(declare-fun it3qtint (it3) Int)

;; it3'axiom
  (assert (forall ((i it3)) (and (<= 1 (it3qtint i)) (<= (it3qtint i) 10))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (it3 it3) Bool)

(declare-const dummy3 it3)

(declare-datatypes ((it3__ref 0))
(((it3__refqtmk (it3__content it3)))))
(define-fun it3__ref_it3__content__projection ((a it3__ref)) it3 (it3__content
                                                                 a))

(define-fun dynamic_invariant2 ((temp___expr_182 Int)
  (temp___is_init_178 Bool) (temp___skip_constant_179 Bool)
  (temp___do_toplevel_180 Bool)
  (temp___do_typ_inv_181 Bool)) Bool (=>
                                     (or (= temp___is_init_178 true)
                                     (<= 1 10)) (in_range4 temp___expr_182)))

(define-fun dynamic_invariant3 ((temp___expr_189 Int)
  (temp___is_init_185 Bool) (temp___skip_constant_186 Bool)
  (temp___do_toplevel_187 Bool)
  (temp___do_typ_inv_188 Bool)) Bool (=>
                                     (or (= temp___is_init_185 true)
                                     (<= 0 99)) (in_range1 temp___expr_189)))

(declare-fun temp_____aggregate_def_215 (map1 Int Int Int Int Int Int Int Int
  Int Int Int) map1)

;; def_axiom
  (assert
  (forall ((temp___217 map1))
  (forall ((temp___218 Int) (temp___219 Int) (temp___220 Int)
  (temp___221 Int) (temp___222 Int) (temp___223 Int) (temp___224 Int)
  (temp___225 Int) (temp___226 Int) (temp___227 Int) (temp___228 Int))
  (let ((temp___216 (temp_____aggregate_def_215 temp___217 temp___218
                    temp___219 temp___220 temp___221 temp___222 temp___223
                    temp___224 temp___225 temp___226 temp___227 temp___228)))
  (=>
  (and (dynamic_invariant temp___218 true true true true)
  (and
  (and
  (and
  (and (dynamic_invariant1 temp___219 true true true true)
  (dynamic_invariant2 temp___220 true true true true)) (dynamic_invariant
  temp___221 true true true true))
  (and (dynamic_invariant1 temp___222 true true true true)
  (dynamic_invariant2 temp___223 true true true true)))
  (and
  (and
  (and (dynamic_invariant3 temp___224 true true true true) (dynamic_invariant
  temp___225 true true true true)) (dynamic_invariant1 temp___226 true true
  true true))
  (and (dynamic_invariant2 temp___227 true true true true)
  (dynamic_invariant3 temp___228 true true true true)))))
  (forall ((temp___229 Int) (temp___230 Int) (temp___231 Int))
  (ite (and (and (= temp___229 temp___225) (= temp___230 temp___226))
       (= temp___231 temp___227))
  (= (to_rep (get temp___216 temp___229 temp___230 temp___231)) temp___228)
  (ite (or
       (and (and (= temp___229 temp___218) (= temp___230 temp___219))
       (= temp___231 temp___220))
       (and (and (= temp___229 temp___221) (= temp___230 temp___222))
       (= temp___231 temp___223)))
  (= (to_rep (get temp___216 temp___229 temp___230 temp___231)) temp___224)
  (= (get temp___216 temp___229 temp___230 temp___231) (get temp___217
                                                       temp___229 temp___230
                                                       temp___231))))))))))

(assert
;; defqtvc
 ;; File "update_checks.ads", line 14, characters 0-0
  (not
  (forall ((a map1))
  (=> (dynamic_invariant x1 true false true true)
  (=> (dynamic_invariant x2 true false true true)
  (=> (dynamic_invariant x3 true false true true)
  (=> (dynamic_invariant1 y1 true false true true)
  (=> (dynamic_invariant1 y2 true false true true)
  (=> (dynamic_invariant1 y3 true false true true)
  (=> (dynamic_invariant2 z1 true false true true)
  (=> (dynamic_invariant2 z2 true false true true)
  (=> (dynamic_invariant2 z3 true false true true)
  (=> (dynamic_invariant3 new_val_1 true false true true)
  (=> (dynamic_invariant3 new_val_2 true false true true)
  (=> (< 1 x1)
  (=> (< 1 y1)
  (=> (< 1 z1)
  (=> (< x2 3)
  (=> (< y2 5)
  (=> (< z2 10)
  (=> (< x3 3)
  (=> (< y3 5)
  (=> (< z3 10)
  (=> (< new_val_1 99)
  (=> (< 0 new_val_2)
  (let ((o (- new_val_2 1)))
  (=> (in_range1 o)
  (let ((o1 (+ z3 1)))
  (=> (in_range4 o1)
  (let ((o2 (+ y3 1)))
  (=> (in_range3 o2)
  (let ((o3 (+ x3 1)))
  (=> (in_range2 o3)
  (let ((o4 (+ new_val_1 1)))
  (=> (in_range1 o4)
  (let ((o5 (+ z2 1)))
  (=> (in_range4 o5)
  (let ((o6 (+ y2 1)))
  (=> (in_range3 o6)
  (let ((o7 (+ x2 1)))
  (=> (in_range2 o7)
  (let ((o8 (- z1 1)))
  (=> (in_range4 o8)
  (let ((o9 (- y1 1)))
  (=> (in_range3 o9)
  (let ((o10 (- x1 1)))
  (=> (in_range2 o10)
  (forall ((a1 map1))
  (=> (= a1 (temp_____aggregate_def_215 a o10 o9 o8 o7 o6 o5 o4 o3 o2 o1 o))
  (in_range1 (+ new_val_1 1)))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
