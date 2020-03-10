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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (index index) Bool)

(declare-const dummy2 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int natural)) (b (Array Int natural)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((nat_array__ref 0))
(((nat_array__refqtmk (nat_array__content us_t)))))
(define-fun nat_array__ref_nat_array__content__projection ((a nat_array__ref)) us_t 
  (nat_array__content a))

(declare-fun invariant__ (us_t) Bool)

(declare-fun invariant____function_guard (Bool us_t) Bool)

(define-fun dynamic_invariant ((temp___expr_222 us_t)
  (temp___is_init_218 Bool) (temp___skip_constant_219 Bool)
  (temp___do_toplevel_220 Bool)
  (temp___do_typ_inv_221 Bool)) Bool (=>
                                     (not (= temp___skip_constant_219 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_222)
                                     (last1 temp___expr_222))))

;; invariant____post_axiom
  (assert true)

;; invariant____def_axiom
  (assert
  (forall ((a us_t))
  (! (= (= (invariant__ a) true) (and (= (first1 a) 1) (<= 0 (last1 a)))) :pattern (
  (invariant__ a)) )))

(declare-fun remove (us_t Int) us_t)

(declare-fun remove__function_guard (us_t us_t Int) Bool)

(define-fun dynamic_invariant1 ((temp___expr_215 Int)
  (temp___is_init_211 Bool) (temp___skip_constant_212 Bool)
  (temp___do_toplevel_213 Bool)
  (temp___do_typ_inv_214 Bool)) Bool (=>
                                     (or (= temp___is_init_211 true)
                                     (<= 1 100)) (in_range3 temp___expr_215)))

;; remove__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((i Int))
  (! (and
     (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1))
     (=>
     (and
     (and (dynamic_invariant a true true true true) (dynamic_invariant1 i
     true true true true))
     (and (= (invariant__ a) true) (and (<= (first1 a) i) (<= i (last1 a)))))
     (let ((result (remove a i)))
     (and
     (forall ((result1 us_t)) (invariant____function_guard
     (invariant__ result1) result1))
     (=> (remove__function_guard result a i)
     (and
     (and
     (and
     (and
     (and (= (invariant__ result) true) (= (last1 result) (- (last1 a) 1)))
     (forall ((k Int))
     (=> (and (<= 1 k) (<= k (- i 1)))
     (= (to_rep (select (to_array a) k)) (to_rep
                                         (select (to_array result) k))))))
     (forall ((k Int))
     (=> (and (<= (+ i 1) k) (<= k (last1 a)))
     (= (to_rep (select (to_array a) k)) (to_rep
                                         (select (to_array result) (- k 1)))))))
     (forall ((k Int))
     (=> (and (<= i k) (<= k (- (last1 a) 1)))
     (= (to_rep (select (to_array a) (+ k 1))) (to_rep
                                               (select (to_array result) k))))))
     (dynamic_invariant result true false true true))))))) :pattern (
  (remove a i)) ))))

(declare-fun is_perm (us_t us_t) Bool)

(declare-fun is_perm__function_guard (Bool us_t us_t) Bool)

;; is_perm__def_axiom
  (assert
  (forall ((a us_t) (b us_t))
  (! (=> (is_perm__function_guard (is_perm a b) a b)
     (and
     (forall ((a1 us_t) (ia Int)) (remove__function_guard (remove a1 ia) a1
     ia))
     (and
     (forall ((b1 us_t) (ib Int)) (remove__function_guard (remove b1 ib) b1
     ib))
     (and
     (forall ((a1 us_t) (ia Int)) (remove__function_guard (remove a1 ia) a1
     ia))
     (and
     (forall ((b1 us_t) (ib Int)) (remove__function_guard (remove b1 ib) b1
     ib))
     (and
     (forall ((a1 us_t) (b1 us_t) (ia Int) (ib Int)) (is_perm__function_guard
     (is_perm (remove a1 ia) (remove b1 ib)) (remove a1 ia) (remove b1 ib)))
     (= (= (is_perm a b) true)
     (or (and (= (length a) 0) (= (length b) 0))
     (exists ((ia Int))
     (and (and (<= (first1 a) ia) (<= ia (last1 a)))
     (exists ((ib Int))
     (and (and (<= (first1 b) ib) (<= ib (last1 b)))
     (and
     (= (to_rep (select (to_array a) ia)) (to_rep (select (to_array b) ib)))
     (= (is_perm (remove a ia) (remove b ib)) true)))))))))))))) :pattern (
  (is_perm a b)) )))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const ia Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (integer integer) Bool)

(declare-const dummy4 integer)

(declare-datatypes ((t13b__ref 0))
(((t13b__refqtmk (t13b__content integer)))))
(define-fun t13b__ref_t13b__content__projection ((a1 t13b__ref)) integer 
  (t13b__content a1))

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

;; is_perm__post_axiom
  (assert
  (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1)))

(assert
;; defqtvc
 ;; File "perm.adb", line 11, characters 0-0
  (not
  (=> (dynamic_invariant a true false true true)
  (=> (dynamic_invariant b true false true true)
  (=> (dynamic_invariant1 ia true false true true)
  (=> (invariant____function_guard (invariant__ a) a)
  (=> (= (invariant__ a) true)
  (=> (invariant____function_guard (invariant__ b) b)
  (=> (= (invariant__ b) true)
  (=> (<= (first1 a) ia)
  (=> (<= ia (last1 a))
  (=> (remove__function_guard (remove a ia) a ia)
  (=> (forall ((ib Int)) (remove__function_guard (remove b ib) b ib))
  (=> (remove__function_guard (remove a ia) a ia)
  (=> (forall ((ib Int)) (remove__function_guard (remove b ib) b ib))
  (=>
  (forall ((ib Int)) (is_perm__function_guard
  (is_perm (remove a ia) (remove b ib)) (remove a ia) (remove b ib)))
  (=>
  (exists ((ib Int))
  (and (and (<= (first1 b) ib) (<= ib (last1 b)))
  (and
  (= (to_rep (select (to_array a) ia)) (to_rep (select (to_array b) ib)))
  (= (is_perm (remove a ia) (remove b ib)) true))))
  (let ((temp___949 (first1 b)))
  (let ((temp___950 (last1 b)))
  (forall ((ib Int))
  (=> (= ib temp___949)
  (=>
  (= (and (ite (<= temp___949 ib) true false) (ite (<= ib temp___950) true
                                              false)) true)
  (forall ((o Int))
  (=> (= (to_rep (select (to_array b) ib)) o)
  (=> (and (<= (first1 a) ia) (<= ia (last1 a)))
  (forall ((o1 Int))
  (=> (= (to_rep (select (to_array a) ia)) o1)
  (=> (forall ((o2 us_t)) (invariant____function_guard (invariant__ o2) o2))
  (=> (forall ((o2 us_t)) (invariant____function_guard (invariant__ o2) o2))
  (=>
  (or (not (= o1 o))
  (and (in_range3 ib)
  (let ((o2 b))
  (let ((o3 (remove o2 ib)))
  (and
  (and (remove__function_guard o3 o2 ib)
  (and (dynamic_invariant o3 true false true true)
  (and
  (and
  (and (and (= (invariant__ o3) true) (= (last1 o3) (- (last1 o2) 1)))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- ib 1)))
  (= (to_rep (select (to_array o2) k)) (to_rep (select (to_array o3) k))))))
  (forall ((k Int))
  (=> (and (<= (+ ib 1) k) (<= k (last1 o2)))
  (= (to_rep (select (to_array o2) k)) (to_rep
                                       (select (to_array o3) (- k 1)))))))
  (forall ((k Int))
  (=> (and (<= ib k) (<= k (- (last1 o2) 1)))
  (= (to_rep (select (to_array o2) (+ k 1))) (to_rep
                                             (select (to_array o3) k))))))))
  (let ((o4 ia))
  (let ((o5 a))
  (let ((o6 (remove o5 o4)))
  (and (remove__function_guard o6 o5 o4)
  (and (dynamic_invariant o6 true false true true)
  (and
  (and
  (and (and (= (invariant__ o6) true) (= (last1 o6) (- (last1 o5) 1)))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- o4 1)))
  (= (to_rep (select (to_array o5) k)) (to_rep (select (to_array o6) k))))))
  (forall ((k Int))
  (=> (and (<= (+ o4 1) k) (<= k (last1 o5)))
  (= (to_rep (select (to_array o5) k)) (to_rep
                                       (select (to_array o6) (- k 1)))))))
  (forall ((k Int))
  (=> (and (<= o4 k) (<= k (- (last1 o5) 1)))
  (= (to_rep (select (to_array o5) (+ k 1))) (to_rep
                                             (select (to_array o6) k))))))))))))))))
  (let ((o2 (ite (= o1 o) (is_perm (remove a ia) (remove b ib)) false)))
  (=>
  (forall ((o3 us_t) (ia1 Int)) (remove__function_guard (remove o3 ia1) o3
  ia1))
  (=>
  (forall ((o3 us_t) (ib1 Int)) (remove__function_guard (remove o3 ib1) o3
  ib1))
  (=>
  (forall ((o3 us_t) (ia1 Int)) (remove__function_guard (remove o3 ia1) o3
  ia1))
  (=>
  (forall ((o3 us_t) (ib1 Int)) (remove__function_guard (remove o3 ib1) o3
  ib1))
  (=>
  (forall ((o3 us_t) (o4 us_t) (ia1 Int) (ib1 Int)) (is_perm__function_guard
  (is_perm (remove o4 ia1) (remove o3 ib1)) (remove o4 ia1) (remove o3 ib1)))
  (=>
  (or (not (= o1 o))
  (let ((o3 (remove b ib)))
  (let ((o4 (remove a ia)))
  (and (is_perm__function_guard o2 o4 o3)
  (= (= o2 true)
  (or (and (= (length o4) 0) (= (length o3) 0))
  (exists ((ia1 Int))
  (and (and (<= (first1 o4) ia1) (<= ia1 (last1 o4)))
  (exists ((ib1 Int))
  (and (and (<= (first1 o3) ib1) (<= ib1 (last1 o3)))
  (and
  (= (to_rep (select (to_array o4) ia1)) (to_rep (select (to_array o3) ib1)))
  (= (is_perm (remove o4 ia1) (remove o3 ib1)) true))))))))))))
  (forall ((spark__branch Bool))
  (=> (= spark__branch o2)
  (=> (not (= spark__branch true))
  (forall ((ib1 Int))
  (=> (remove__function_guard (remove a ia) a ia)
  (=> (forall ((kb Int)) (remove__function_guard (remove b kb) b kb))
  (=> (remove__function_guard (remove a ia) a ia)
  (=> (forall ((kb Int)) (remove__function_guard (remove b kb) b kb))
  (=>
  (forall ((kb Int)) (is_perm__function_guard
  (is_perm (remove a ia) (remove b kb)) (remove a ia) (remove b kb)))
  (=>
  (forall ((kb Int))
  (=> (and (<= 1 kb) (<= kb ib1))
  (not
  (and
  (= (to_rep (select (to_array a) ia)) (to_rep (select (to_array b) kb)))
  (= (is_perm (remove a ia) (remove b kb)) true)))))
  (=>
  (= (and (ite (dynamic_property1 (first1 b) (last1 b) ib1) true false) 
  (ite (and (<= (first1 b) ib1) (<= ib1 (last1 b))) true false)) true)
  (=> (not (= ib1 temp___950))
  (forall ((ib2 Int))
  (=> (= ib2 (+ ib1 1))
  (forall ((o3 Int))
  (=> (= (to_rep (select (to_array b) ib2)) o3)
  (=> (and (<= (first1 a) ia) (<= ia (last1 a)))
  (forall ((o4 Int))
  (=> (= (to_rep (select (to_array a) ia)) o4)
  (=> (forall ((o5 us_t)) (invariant____function_guard (invariant__ o5) o5))
  (=> (forall ((o5 us_t)) (invariant____function_guard (invariant__ o5) o5))
  (=>
  (or (not (= o4 o3))
  (and (in_range3 ib2)
  (let ((o5 b))
  (let ((o6 (remove o5 ib2)))
  (and
  (and (remove__function_guard o6 o5 ib2)
  (and (dynamic_invariant o6 true false true true)
  (and
  (and
  (and (and (= (invariant__ o6) true) (= (last1 o6) (- (last1 o5) 1)))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- ib2 1)))
  (= (to_rep (select (to_array o5) k)) (to_rep (select (to_array o6) k))))))
  (forall ((k Int))
  (=> (and (<= (+ ib2 1) k) (<= k (last1 o5)))
  (= (to_rep (select (to_array o5) k)) (to_rep
                                       (select (to_array o6) (- k 1)))))))
  (forall ((k Int))
  (=> (and (<= ib2 k) (<= k (- (last1 o5) 1)))
  (= (to_rep (select (to_array o5) (+ k 1))) (to_rep
                                             (select (to_array o6) k))))))))
  (let ((o7 ia))
  (let ((o8 a))
  (let ((o9 (remove o8 o7)))
  (and (remove__function_guard o9 o8 o7)
  (and (dynamic_invariant o9 true false true true)
  (and
  (and
  (and (and (= (invariant__ o9) true) (= (last1 o9) (- (last1 o8) 1)))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- o7 1)))
  (= (to_rep (select (to_array o8) k)) (to_rep (select (to_array o9) k))))))
  (forall ((k Int))
  (=> (and (<= (+ o7 1) k) (<= k (last1 o8)))
  (= (to_rep (select (to_array o8) k)) (to_rep
                                       (select (to_array o9) (- k 1)))))))
  (forall ((k Int))
  (=> (and (<= o7 k) (<= k (- (last1 o8) 1)))
  (= (to_rep (select (to_array o8) (+ k 1))) (to_rep
                                             (select (to_array o9) k))))))))))))))))
  (let ((o5 (ite (= o4 o3) (is_perm (remove a ia) (remove b ib2)) false)))
  (=>
  (forall ((o6 us_t) (ia1 Int)) (remove__function_guard (remove o6 ia1) o6
  ia1))
  (=>
  (forall ((o6 us_t) (ib3 Int)) (remove__function_guard (remove o6 ib3) o6
  ib3))
  (=>
  (forall ((o6 us_t) (ia1 Int)) (remove__function_guard (remove o6 ia1) o6
  ia1))
  (=>
  (forall ((o6 us_t) (ib3 Int)) (remove__function_guard (remove o6 ib3) o6
  ib3))
  (=>
  (forall ((o6 us_t) (o7 us_t) (ia1 Int) (ib3 Int)) (is_perm__function_guard
  (is_perm (remove o7 ia1) (remove o6 ib3)) (remove o7 ia1) (remove o6 ib3)))
  (=>
  (or (not (= o4 o3))
  (let ((o6 (remove b ib2)))
  (let ((o7 (remove a ia)))
  (and (is_perm__function_guard o5 o7 o6)
  (= (= o5 true)
  (or (and (= (length o7) 0) (= (length o6) 0))
  (exists ((ia1 Int))
  (and (and (<= (first1 o7) ia1) (<= ia1 (last1 o7)))
  (exists ((ib3 Int))
  (and (and (<= (first1 o6) ib3) (<= ib3 (last1 o6)))
  (and
  (= (to_rep (select (to_array o7) ia1)) (to_rep (select (to_array o6) ib3)))
  (= (is_perm (remove o7 ia1) (remove o6 ib3)) true))))))))))))
  (forall ((spark__branch1 Bool))
  (=> (= spark__branch1 o5)
  (=> (not (= spark__branch1 true))
  (forall ((usf Int))
  (=>
  (= (and (ite (<= 1 usf) true false) (ite (<= usf ib2) true false)) true)
  (=> (and (<= (first1 b) usf) (<= usf (last1 b)))
  (forall ((o6 Int))
  (=> (= (to_rep (select (to_array b) usf)) o6)
  (=> (and (<= (first1 a) ia) (<= ia (last1 a)))
  (forall ((o7 Int))
  (=> (= (to_rep (select (to_array a) ia)) o7)
  (=> (= o7 o6) (in_range3 usf)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
